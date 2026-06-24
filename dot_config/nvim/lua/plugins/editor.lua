return {
	{
		"nvim-neo-tree/neo-tree.nvim",
		config = function()
			require("neo-tree").setup({
				-- Your custom configuration options here
				sources = {
					"filesystem",
					"buffers",
					"git_status",
				},
				filesystem = {
					follow_current_file = true,
					use_libuv_file_watcher = true,
				},
				buffers = {
					show_unloaded = true,
				},
				git_status = {
					window = {
						position = "float",
					},
				},
				window = {
					mappings = {
						["l"] = "open",
					},
				},
				-- Add other options as needed
			})
		end,
	},
	{
		"linux-cultist/venv-selector.nvim",
		dependencies = {
			{ "nvim-telescope/telescope.nvim", version = "*", dependencies = { "nvim-lua/plenary.nvim" } }, -- optional: you can also use fzf-lua, snacks, mini-pick instead.
		},
		ft = "python", -- Load when opening Python files
		keys = { { ",v", "<cmd>VenvSelect<cr>" } }, -- Open picker on keymap
		opts = {
			options = {}, -- plugin-wide options
			search = {}, -- custom search definitions
		},
	},
}
