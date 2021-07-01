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
      '#44bec7',
      '#eadd61',
      '#63c97b',
      '#d696bb',
      '#8b9dc3',
    }
  }
}
