local null_ls = require('null-ls')
local b = null_ls.builtins

local sources = {
    b.code_actions.gitsigns,
    b.formatting.trim_whitespace,
    b.formatting.dart_format,
    b.formatting.go_fmt,
}

local M = {}
M.setup = function(on_attach)
    null_ls.config({
        -- debug = true,
        sources = sources,
    })
    require('lspconfig')['null-ls'].setup({ on_attach = on_attach })
end

return M
