local sorters = require'telescope.sorters'

require('telescope').setup {
  defaults = {
    winblend = 0,
    layout_strategy = "horizontal",
  
    selection_strategy = "reset",
    prompt_position = "top",
    sorting_strategy = "descending",
    scroll_strategy = "cycle",
    color_devicons = true,

    mappings = {},

    file_sorter = sorters.get_fzy_sorter,

    file_previewer = require('telescope.previewers').vim_buffer_cat.new,
    grep_previewer = require('telescope.previewers').vim_buffer_vimgrep.new,
  },

  extensions = {
    fzy_native = {
      override_generic_sorter = true,
      override_file_sorter = true,
    }
  },
}

pcall(require('telescope').load_extension "fzy_native")
pcall(require('telescope').load_extension "flutter")

require'my.telescope.mappings'
