return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	---@type snacks.Config
	opts = {
		-- your configuration comes here
		-- or leave it empty to use the default settings
		-- refer to the configuration section below
		-- bigfile = { enabled = true },
		dashboard = {
			enabled = true,
			sections = {
				{ section = "header" },
				{
					text = "Version "
						.. vim.version().major
						.. "."
						.. vim.version().minor
						.. "."
						.. vim.version().patch,
					padding = 1,
					align = "center",
				},
				{ icon = " ", title = "Keymaps", section = "keys", indent = 2, padding = 1 },
				{ icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
				{ icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
				{ section = "startup" },
			},
		},
		-- explorer = { enabled = true },
		-- indent = { enabled = true },
		-- input = { enabled = true },
		picker = { enabled = true },
		terminal = { enabled = true },
		lazygit = { enabled = true },
		-- notifier = { enabled = true },
		-- quickfile = { enabled = true },
		-- scope = { enabled = true },
		-- scroll = { enabled = true },
		-- statuscolumn = { enabled = true },
		-- words = { enabled = true },
	},
	keys = {
		-- Top Pickers & Explorer
		{
			"<leader><space>",
			function()
				Snacks.picker.smart()
			end,
			desc = "Smart Find Files",
		},
		{
			"<leader>,",
			function()
				Snacks.picker.buffers()
			end,
			desc = "Buffers",
		},
		{
			"<leader>/",
			function()
				Snacks.picker.grep()
			end,
			desc = "Grep",
		},
		{
			"<leader>:",
			function()
				Snacks.picker.command_history()
			end,
			desc = "Command History",
		},
		{
			"<leader>n",
			function()
				Snacks.picker.notifications()
			end,
			desc = "Notification History",
		},
		{
			"<leader>e",
			function()
				Snacks.explorer()
			end,
			desc = "File Explorer",
		},
		-- Terminal
		{
			"<C-\\>",
			function()
				Snacks.terminal()
			end,
			desc = "Toggle Terminal",
		},
		{
			"<leader>th",
			function()
				Snacks.terminal(nil, { win = { position = "bottom" } })
			end,
			desc = "Terminal Horizontal",
		},
		{
			"<leader>tv",
			function()
				Snacks.terminal(nil, { win = { position = "right" } })
			end,
			desc = "Terminal Vertical",
		},
		{
			"<leader>tf",
			function()
				Snacks.terminal(nil, { win = { position = "float" } })
			end,
			desc = "Terminal Float",
		},
		-- Git
		{
			"<leader>lg",
			function()
				Snacks.lazygit()
			end,
			desc = "Lazygit",
		},
	},
}
