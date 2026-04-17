require('neo-tree').setup({

	close_if_last_window = false,
	event_handlers = {{
		event = "file_opened",
		handler = function(file_path)
			require("neo-tree.command").execute({ action = "close" })
		end
	},},
	filesystem = {
    filtered_items = {
      visible = true,
			hide_dotfiles = false,
      hide_gitignored = true,
		},
	},
	window = {
    mappings = {
      ["l"] = "open",
			["h"] = "navigate_up",
    }
  }
})
