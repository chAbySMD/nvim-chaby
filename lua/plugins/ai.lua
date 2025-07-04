return {
	{
		"milanglacier/minuet-ai.nvim",
		config = function()
			local gemini_prompt = [[
You are the backend of an AI-powered code completion engine. Your task is to
provide code suggestions based on the user's input. I need from you documentations for my code, but only in Russian. 
In documentation write about overall functionality and then if needed list functionality.
The user's code will be enclosed in markers:

- `<contextAfterCursor>`: Code context after the cursor
- `<cursorPosition>`: Current cursor location
- `<contextBeforeCursor>`: Code context before the cursor
]]

			local gemini_few_shots = {}

			gemini_few_shots[1] = {
				role = "user",
				content = [[
# language: python
<contextBeforeCursor>
def fibonacci(n):
    <cursorPosition>
<contextAfterCursor>

fib(5)]],
			}

			local gemini_chat_input_template =
				"{{{language}}}\n{{{tab}}}\n<contextBeforeCursor>\n{{{context_before_cursor}}}<cursorPosition>\n<contextAfterCursor>\n{{{context_after_cursor}}}"

			gemini_few_shots[2] = require("minuet.config").default_few_shots[2]

			require("minuet").setup({
				provider = "openai_compatible",
				request_timeout = 2.5,
				throttle = 1500, -- Increase to reduce costs and avoid rate limits
				debounce = 600, -- Increase to reduce costs and avoid rate limits

				provider_options = {
					openai_compatible = {
						api_key = "OPENROUTER_API_KEY",
						end_point = "https://openrouter.ai/api/v1/chat/completions",
						model = "deepseek/deepseek-chat-v3-0324",
						name = "Openrouter",

						system = {
							prompt = gemini_prompt,
						},
						few_shots = gemini_few_shots,
						chat_input = {
							template = gemini_chat_input_template,
						},

						optional = {
							max_tokens = 56,
							top_p = 0.9,
							system_prompt = "Ты выступаешь в роли опытного разработчика на Elixir с глубоким знанием фреймворка Phoenix. При написании кода всегда сопровождай функции и модули подробной документацией на русском языке в формате @doc. Используй идиоматичный Elixir-код, следи за чистотой и читаемостью. Если задаю вопрос или прошу что-то реализовать — пиши рабочий код с пояснениями. Не используй английский в комментариях и документации, кроме идентификаторов. Примеры использования функций пиши, где уместно.",
							provider = {
								-- Prioritize throughput for faster completion
								sort = "throughput",
							},
						},
					},
				},
				virtualtext = {
					auto_trigger_ft = { "elixir" },
					keymap = {
						-- accept whole completion
						accept = "<A-f>",
						-- accept one line
						accept_line = "<A-k>",
						-- accept n lines (prompts for number)
						-- e.g. "A-z 2 CR" will accept 2 lines
						accept_n_lines = "<A-z>",
						-- Cycle to prev completion item, or manually invoke completion
						prev = "<A-h>",
						-- Cycle to next completion item, or manually invoke completion
						next = "<A-l>",
						dismiss = "<A-e>",
					},
				},
			})
		end,
	},
}
