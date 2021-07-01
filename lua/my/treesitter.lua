local has_playground = pcall(require, 'nvim-treesitter-playground')
local has_rainbow = pcall(require, 'rainbow')
require'nvim-treesitter.configs'.setup {
  ensure_installed = 'maintained',
  highlight = { 
    enable = false,
    disable = {},
  },
  playground = {
    enable = has_playground,
    disable = {},
    updatetime = 25,
    persist_queries = false,
  },
  rainbow = {
    enable = has_rainbow,
    extended_mode = true,
    max_file_lines = 500,
    colors = {
      '#f23269',
      '#eadd61',
      '#b172dd',
      '#63c97b',
      '#35c587',
    }
  }
}
