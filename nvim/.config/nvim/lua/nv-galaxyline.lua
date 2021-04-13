local condition = require "galaxyline.condition"

-- local colors = {
--     bg = "#282828",
--     bg1 = "#3c3836",
--     fg = "#ebdbb2",
--     fg1 = "#d5c4a1",
--     red = "#cc241d",
--     green = "#98971a",
--     yellow = "#d79921",
--     blue = "#458588",
--     purple = "#b16286",
--     aqua = "#689d6a",
--     gray = "#a89984",
--     orange = "#d65d0e",
--     light_red = "#fb4934",
--     light_green = "#b8bb26",
--     light_yellow = "#fabd2f",
--     light_blue = "#83a598",
--     light_purple = "#d3869b",
--     light_aqua = "#8ec07c",
--     light_orange = "#fe8019"
-- }
local colors = {
    bg0 = "#101010",
    bg1 = "#262727",
    bg2 = "#282828",
    bg3 = "#3c3836",
    bg4 = "#3c3836",
    bg5 = "#504945",
    bg_statusline1 = "#282828",
    bg_statusline2 = "#32302f",
    bg_statusline3 = "#504945",
    bg_diff_green = "#32361a",
    bg_visual_green = "#333e34",
    bg_diff_red = "#3c1f1e",
    bg_visual_red = "#442e2d",
    bg_diff_blue = "#0d3138",
    bg_visual_blue = "#2e3b3b",
    bg_visual_yellow = "#473c29",
    bg_current_word = "#32302f",
    fg0 = "#d4be98",
    fg1 = "#ddc7a1",
    red = "#ea6962",
    orange = "#e78a4e",
    yellow = "#d8a657",
    green = "#a9b665",
    aqua = "#89b482",
    blue = "#7daea3",
    purple = "#d3869b",
    bg_red = "#ea6962",
    bg_green = "#a9b665",
    bg_yellow = "#d8a657",
    grey0 = "#7c6f64",
    grey1 = "#928374",
    grey2 = "#a89984",
    none = "NONE"
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
        highlight = {colors.none, colors.bg_statusline2},
        separator = "",
        separator_highlight = {colors.bg_statusline2, colors.fg0}
    }
}

require"galaxyline".section.left[2] = {
    GitBranch = {
        provider = "GitBranch",
        condition = condition.check_git_workspace,
        icon = "   ",
        highlight = {colors.bg_statusline2, colors.fg0},
        separator = "",
        separator_highlight = {colors.fg0, colors.bg_statusline2}
    }
}

require"galaxyline".section.left[3] = {
    DiffAdd = {provider = "DiffAdd", icon = "  ", highlight = {colors.green, colors.bg_statusline2}}
}

require"galaxyline".section.left[4] = {
    DiffModified = {provider = "DiffModified", icon = "  ", highlight = {colors.blue, colors.bg_statusline2}}
}

require"galaxyline".section.left[5] = {
    DiffRemove = {provider = "DiffRemove", icon = "  ", highlight = {colors.red, colors.bg_statusline2}}
}

require"galaxyline".section.left[6] = {
    DiagnosticError = {provider = "DiagnosticError", icon = "  ", highlight = {colors.red, colors.bg_statusline2}}
}

require"galaxyline".section.left[7] = {
    DiagnosticWarning = {
        provider = "DiagnosticWarn",
        icon = "  ",
        highlight = {colors.orange, colors.bg_statusline2}
    }
}

require"galaxyline".section.left[8] = {
    DiagnosticHint = {provider = "DiagnosticHint", icon = "  ", highlight = {colors.blue, colors.bg_statusline2}}
}

require"galaxyline".section.left[9] = {
    DiagnosticInfo = {provider = "DiagnosticInfo", icon = "  ", highlight = {colors.aqua, colors.bg_statusline2}}
}

-- Right --

require"galaxyline".section.right[1] = {
    LspClient = {
        provider = "GetLspClient",
        icon = " ",
        highlight = {colors.bg_statusline2, colors.fg0},
        separator = " ",
        separator_highlight = {colors.bg_statusline2, colors.fg0}
    }
}

require"galaxyline".section.right[2] = {
    FileIcon = {
        provider = "FileIcon",
        highlight = {colors.fg0, colors.bg_statusline2},
        separator = " ",
        separator_highlight = {colors.fg0, colors.bg_statusline2}

    }
}

require"galaxyline".section.right[3] = {
    FileName = {provider = "FileName", highlight = {colors.fg0, colors.bg_statusline2}}
}

require"galaxyline".section.right[4] = {
    LineColumn = {
        provider = "LineColumn",
        highlight = {colors.bg_statusline2, colors.fg0},
        separator = " ",
        separator_highlight = {colors.bg_statusline2, colors.fg0}
    }
}

require"galaxyline".section.right[5] = {
    LinePercent = {
        provider = "LinePercent",
        highlight = {colors.fg0, colors.bg_statusline2},
        separator = " ",
        separator_highlight = {colors.fg0, colors.bg_statusline2}

    }
}

require"galaxyline".section.right[6] = {
    ScrollBar = {
        provider = "ScrollBar",
        highlight = {colors.bg_statusline2, colors.fg0},
        separator = " ",
        separator_highlight = {colors.bg_statusline2, colors.fg0}
    }
}

require"galaxyline".section.right[7] = {
    Space = {provider = function() return " " end, highlight = {colors.none, colors.bg_statusline2}}
}

-- Short Line Left --

require"galaxyline".section.short_line_left[1] = {
    FileTypeName = {
        provider = "FileTypeName",
        highlight = {colors.fg0, colors.bg_statusline2},
        separator = " ",
        separator_highlight = {colors.none, colors.bg_statusline2}
    }
}

require"galaxyline".section.short_line_left[2] = {
    SFileName = {
        provider = "SFileName",
        condition = condition.buffer_not_empty,
        highlight = {colors.fg0, colors.bg_statusline2}
    }
}

-- Short Line Right --

require"galaxyline".section.short_line_right[1] = {
    BufferIcon = {provider = "BufferIcon", highlight = {colors.fg0, colors.bg_statusline2}}
}
