return {
	"rcarriga/nvim-notify",
	config = function()
		require("notify").setup({
			background_colour = "NotifyBackground",
			fps = 30,
			icons = {
				DEBUG = "",
				ERROR = "",
				INFO = "",
				TRACE = "✎",
				WARN = "",
			},
			level = 2,
			minimum_width = 50,
			max_width = 50,
			-- render = "wrapped-compact",
			render = "minimal",

			stages = "fade_in_slide_out",
			time_formats = {
				notification = "%T",
				notification_history = "%FT%T",
			},
			timeout = 2000,
			top_down = true,
		})
	end,
}
