local condition = require("galaxyline.condition")

local colors = {
	bg = "#3c3836",
	fg = "#f2e5bc",
	red = "#fb4934",
	green = "#b8bb26",
	yellow = "#fabd2f",
	blue = "#83a598",
	purple = "#d3869b",
	aqua = "#8ec07c",
	orange = "#fe8019",
	none = "NONE",
}

require("galaxyline").short_line_list = { "NvimTree", "packer" }

-- Left --

require("galaxyline").section.left[1] = {
	GitBranch = {
		provider = "GitBranch",
		condition = condition.check_git_workspace,
		icon = "    ",
		highlight = { colors.bg, colors.fg },
		separator = "",
		separator_highlight = { colors.fg, colors.bg },
	},
}

require("galaxyline").section.left[2] = {
	DiffAdd = { provider = "DiffAdd", icon = "  ", highlight = { colors.green, colors.bg } },
}

require("galaxyline").section.left[3] = {
	DiffModified = { provider = "DiffModified", icon = "  ", highlight = { colors.blue, colors.bg } },
}

require("galaxyline").section.left[4] = {
	DiffRemove = { provider = "DiffRemove", icon = "  ", highlight = { colors.red, colors.bg } },
}

require("galaxyline").section.left[5] = {
	DiagnosticError = { provider = "DiagnosticError", icon = "  ", highlight = { colors.red, colors.bg } },
}

require("galaxyline").section.left[6] = {
	DiagnosticWarning = {
		provider = "DiagnosticWarn",
		icon = "  ",
		highlight = { colors.orange, colors.bg },
	},
}

require("galaxyline").section.left[7] = {
	DiagnosticHint = { provider = "DiagnosticHint", icon = "  ", highlight = { colors.blue, colors.bg } },
}

require("galaxyline").section.left[8] = {
	DiagnosticInfo = { provider = "DiagnosticInfo", icon = "  ", highlight = { colors.aqua, colors.bg } },
}

-- Right --

require("galaxyline").section.right[1] = {
	LspClient = {
		provider = "GetLspClient",
		icon = " ",
		highlight = { colors.bg, colors.fg },
		separator = " ",
		separator_highlight = { colors.bg, colors.fg },
	},
}

require("galaxyline").section.right[2] = {
	FileIcon = {
		provider = "FileIcon",
		highlight = { colors.fg, colors.bg },
		separator = " ",
		separator_highlight = { colors.fg, colors.bg },
	},
}

require("galaxyline").section.right[3] = {
	FileName = { provider = "FileName", highlight = { colors.fg, colors.bg } },
}

require("galaxyline").section.right[4] = {
	LineColumn = {
		provider = "LineColumn",
		highlight = { colors.bg, colors.fg },
		separator = " ",
		separator_highlight = { colors.bg, colors.fg },
	},
}

require("galaxyline").section.right[5] = {
	LinePercent = {
		provider = "LinePercent",
		highlight = { colors.fg, colors.bg },
		separator = " ",
		separator_highlight = { colors.fg, colors.bg },
	},
}

require("galaxyline").section.right[6] = {
	ScrollBar = {
		provider = "ScrollBar",
		highlight = { colors.bg, colors.fg },
		separator = " ",
		separator_highlight = { colors.bg, colors.fg },
	},
}

require("galaxyline").section.right[7] = {
	Space = {
		provider = function()
			return " "
		end,
		highlight = { colors.none, colors.bg },
	},
}

-- Short Line Left --

require("galaxyline").section.short_line_left[1] = {
	FileTypeName = {
		provider = "FileTypeName",
		highlight = { colors.fg, colors.bg },
		separator = " ",
		separator_highlight = { colors.none, colors.bg },
	},
}

require("galaxyline").section.short_line_left[2] = {
	SFileName = {
		provider = "SFileName",
		condition = condition.buffer_not_empty,
		highlight = { colors.fg, colors.bg },
	},
}

-- Short Line Right --

require("galaxyline").section.short_line_right[1] = {
	BufferIcon = { provider = "BufferIcon", highlight = { colors.fg, colors.bg } },
}
