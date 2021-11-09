
vim.g["ale_lint_on_save"] = 1
vim.g["ale_completion_enabled"] = 0
vim.g["ale_fix_on_save"] = 1

-- languages with default formatters
-- otherwise use .nvimrc file and define them
vim.g["ale_fixers"] = {
  dart = {"dart-format"},
  go = {"gofmt"}
}


-- local my_source = {}
-- -- all filetypes
-- my_source.filetypes = {}

-- local null_ls = require("null-ls")
-- -- using config method
-- null_ls.config({ sources = my_sources })
