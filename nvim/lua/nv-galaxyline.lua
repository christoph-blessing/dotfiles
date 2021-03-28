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

require"galaxyline".section.left[1] = {
    GitBranch = {
        provider = "GitBranch",
        condition = condition.check_git_workspace,
        icon = "    ",
        highlight = {colors.bg1, colors.fg1},
        separator = "",
        separator_highlight = {colors.fg1, colors.bg1}
    }
}

require"galaxyline".section.left[2] = {
    DiffAdd = {provider = "DiffAdd", icon = "  ", highlight = {colors.green, colors.bg1}}
}

require"galaxyline".section.left[3] = {
    DiffModified = {provider = "DiffModified", icon = "  ", highlight = {colors.blue, colors.bg1}}
}

require"galaxyline".section.left[4] = {
    DiffRemove = {provider = "DiffRemove", icon = "  ", highlight = {colors.red, colors.bg1}}
}

require"galaxyline".section.left[5] = {
    DiagnosticError = {provider = "DiagnosticError", icon = "  ", highlight = {colors.red, colors.bg1}}
}

require"galaxyline".section.left[6] = {
    DiagnosticWarning = {provider = "DiagnosticWarn", icon = "  ", highlight = {colors.orange, colors.bg1}}
}

require"galaxyline".section.left[7] = {
    DiagnosticHint = {provider = "DiagnosticHint", icon = "  ", highlight = {colors.blue, colors.bg1}}
}

require"galaxyline".section.left[8] = {
    DiagnosticInfo = {provider = "DiagnosticInfo", icon = "  ", highlight = {colors.aqua, colors.bg1}}
}

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
