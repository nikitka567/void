-- In your init.lua
require('nvim-web-devicons').setup {
  default = false,
	color_icons = true,
			override = {
			odin = {
				icon = "󱃓 ",
				color = "#a0a0ef",
				name = "Odin",
			},
			frag = {
				icon = " ",
				color = "#ffff90",
				name = "frag",
			},
			vert = {
				icon = " ",
				color = "#90ff90",
				name = "vert",
			},
			spv = {
				icon = " ",
				color = "#ff9090",
				name = "spir-v",
			}
		}
}


