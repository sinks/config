
-- require'compe'.setup {
--   enabled = true;
--   autocomplete = true;
--   preselect = 'enable';
--   source = {
--     path = true;
--     buffer = true;
--     nvim_lsp = true;
--   };
-- }

-- ms-jpq/coq_nvim
-- vim.g.coq_settings = {  
--   auto_start = 'shut-up';
-- }

local cmp = require'cmp'
cmp.setup {
  sources = {
    { name = 'nvim_lsp' },
    { name = 'buffer' },
    { name = 'path' }
  },
  mapping = {
    ['<C-d>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
    ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
    ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
    ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
    ['<C-e>'] = cmp.mapping({
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    }),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  }
}
