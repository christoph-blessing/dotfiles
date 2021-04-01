local condition = require "galaxyline.condition"

local colors = {
    bg = "#282828",
    bg1 = "#3c3836",
    fg = "#ebdbb2",
    fg1 = "#d5c4a1",
    red = "#cc241d",
    green = "#98971a",
    yellow = "#d79921",
    blue = "#458588",
    purple = "#b16286",
    aqua = "#689d6a",
    gray = "#a89984",
    orange = "#d65d0e",
    light_red = "#fb4934",
    light_green = "#b8bb26",
    light_yellow = "#fabd2f",
    light_blue = "#83a598",
    light_purple = "#d3869b",
    light_aqua = "#8ec07c",
    light_orange = "#fe8019"
}

require"galaxyline".short_line_list = {"NvimTree", "packer"}

-- Left --

require"galaxyline".section.left[1] = {
    ViMode = {
        provider = function()
            local mode_color = {
                n = colors.blue,
                i = colors.orange,
                v = colors.purple,
                V = colors.purple,
                [""] = colors.purple,
                c = colors.red,
                no = colors.blue,
                s = colors.green,
                S = colors.green,
                [""] = colors.green,
                ic = colors.yellow,
                R = colors.aqua,
                Rv = colors.aqua,
                cv = colors.blue,
                ce = colors.blue,
                r = colors.light_blue,
                rm = colors.light_blue,
                ["!"] = colors.blue,
                t = colors.blue
            }
            vim.api.nvim_command("hi GalaxyViMode guifg=" .. mode_color[vim.fn.mode()])
            return "▊"
        end,
        highlight = {"NONE", colors.bg1},
        separator = "",
        separator_highlight = {colors.bg1, colors.fg1}
    }
}

require"galaxyline".section.left[2] = {
    GitBranch = {
        provider = "GitBranch",
        condition = condition.check_git_workspace,
        icon = "   ",
        highlight = {colors.bg1, colors.fg1},
        separator = "",
        separator_highlight = {colors.fg1, colors.bg1}
    }
}

require"galaxyline".section.left[3] = {
    DiffAdd = {provider = "DiffAdd", icon = "  ", highlight = {colors.green, colors.bg1}}
}

require"galaxyline".section.left[4] = {
    DiffModified = {provider = "DiffModified", icon = "  ", highlight = {colors.blue, colors.bg1}}
}

require"galaxyline".section.left[5] = {
    DiffRemove = {provider = "DiffRemove", icon = "  ", highlight = {colors.red, colors.bg1}}
}

require"galaxyline".section.left[6] = {
    DiagnosticError = {provider = "DiagnosticError", icon = "  ", highlight = {colors.red, colors.bg1}}
}

require"galaxyline".section.left[7] = {
    DiagnosticWarning = {provider = "DiagnosticWarn", icon = "  ", highlight = {colors.orange, colors.bg1}}
}

require"galaxyline".section.left[8] = {
    DiagnosticHint = {provider = "DiagnosticHint", icon = "  ", highlight = {colors.blue, colors.bg1}}
}

require"galaxyline".section.left[9] = {
    DiagnosticInfo = {provider = "DiagnosticInfo", icon = "  ", highlight = {colors.aqua, colors.bg1}}
}

-- Right --

require"galaxyline".section.right[1] = {
    LspClient = {
        provider = "GetLspClient",
        icon = " ",
        highlight = {colors.bg1, colors.fg1},
        separator = " ",
        separator_highlight = {colors.bg1, colors.fg1}
    }
}

require"galaxyline".section.right[2] = {
    FileIcon = {
        provider = "FileIcon",
        highlight = {colors.fg1, colors.bg1},
        separator = " ",
        separator_highlight = {colors.fg1, colors.bg1}

    }
}

require"galaxyline".section.right[3] = {FileName = {provider = "FileName", highlight = {colors.fg1, colors.bg1}}}

require"galaxyline".section.right[4] = {
    LineColumn = {
        provider = "LineColumn",
        highlight = {colors.bg1, colors.fg1},
        separator = " ",
        separator_highlight = {colors.bg1, colors.fg1}
    }
}

require"galaxyline".section.right[5] = {
    LinePercent = {
        provider = "LinePercent",
        highlight = {colors.fg1, colors.bg1},
        separator = " ",
        separator_highlight = {colors.fg1, colors.bg1}

    }
}

require"galaxyline".section.right[6] = {
    ScrollBar = {
        provider = "ScrollBar",
        highlight = {colors.bg1, colors.fg1},
        separator = " ",
        separator_highlight = {colors.bg1, colors.fg1}
    }
}

require"galaxyline".section.right[7] = {
    Space = {provider = function() return " " end, highlight = {"NONE", colors.fg1}}
}

-- Short Line Left --

require"galaxyline".section.short_line_left[1] = {
    FileTypeName = {
        provider = "FileTypeName",
        highlight = {colors.fg1, colors.bg1},
        separator = " ",
        separator_highlight = {"None", colors.bg1}
    }
}

require"galaxyline".section.short_line_left[2] = {
    SFileName = {provider = "SFileName", condition = condition.buffer_not_empty, highlight = {colors.fg1, colors.bg1}}
}

-- Short Line Right --

require"galaxyline".section.short_line_right[1] = {
    BufferIcon = {provider = "BufferIcon", highlight = {colors.fg1, colors.bg1}}
}