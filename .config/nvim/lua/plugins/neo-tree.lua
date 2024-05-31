return {
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
}
