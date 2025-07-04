return {
	"folke/snacks.nvim",
	priority = 1000,
	opts = {
		input = { enabled = true },
		bigfile = {
			enabled = true,
			notify = true,
			size = 1.5 * 1024 * 1024,
			line_length = 1000
		},
		notifier = {
			enabled = true,
			timeout = 2000
		},
		quickfile = {
			enabled = true
		},
		indent = {
			enabled = true,
		}
	}
}
