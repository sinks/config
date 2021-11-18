local keymap = vim.api.nvim_set_keymap

-- keymap('i', '<C-Space>', "compe#complete()", {noremap = true, silent = true, expr = true})
-- keymap('i', '<CR>', "compe#confirm('<CR>')", {noremap = true, silent = true, expr = true})

-- leader single letters
keymap('', '<Leader>p', ":Telescope find_files<CR>", {noremap = true, silent = true})
keymap('', '<Leader>fp', ":Telescope find_files<CR>", {noremap = true, silent = true})
keymap('', '<Leader>fb', ":Telescope buffers<CR>", {noremap = true, silent = true})
keymap('', '<Leader>fg', ':Telescope live_grep<CR>', { noremap = true, silent = true })
keymap('', '<Leader>n', ':NERDTreeFind<CR>', { noremap = true, silent = true })

-- commenting
keymap("n", "<leader>;", "<Plug>kommentary_line_default", {})
keymap("x", "<leader>;", "<Plug>kommentary_visual_default", {})

-- lsp
keymap('', '<Leader>a', ":Telescope lsp_code_actions<CR>", {noremap = true, silent = true})

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer

