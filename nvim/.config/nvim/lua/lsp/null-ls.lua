local null_ls = require("null-ls")
local helpers = require("null-ls.helpers")

local sources = {null_ls.builtins.diagnostics.flake8}

local find_entries = function(line, pattern, groups)
    local entries = {}
    local results = {line:match(pattern)}
    if next(results) == nil then return false, entries end
    for i, match in ipairs(results) do entries[groups[i]] = match end
    return true, entries
end

local mypy = {
    method = null_ls.methods.DIAGNOSTICS,
    filetypes = {"python"},
    generator = helpers.generator_factory({
        command = "/home/chris/.config/nvim/scripts/mypy.sh",
        to_stdin = true,
        args = {"$FILENAME"},
        format = "line",
        on_output = function(line, params)
            local severities = {error = 1, warning = 2, note = 4}
            local patterns = {
                [":(%d+):(%d+): (%w+): (.*)"] = {"row", "col", "severity", "message"},
                [":(%d+): (%w+): (.*)"] = {"row", "severity", "message"}
            }
            for pattern, groups in pairs(patterns) do
                success, entries = find_entries(line, pattern, groups)
                if success then
                    entries["severity"] = severities[entries["severity"]]
                    return entries
                end
            end
        end
    })
}
table.insert(sources, mypy)

null_ls.config({sources = sources})

return {}
