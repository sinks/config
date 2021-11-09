require("telescope").setup {
  pickers = {
    buffers = {
      sort_lastused = true,
      theme = "ivy",
      previewer = false,
    },
    find_files = {
      theme = "ivy"
    },
		live_grep = {
      theme = "ivy"
		},
		lsp_code_actions = {
			theme = "cursor"
		}
  },
}
