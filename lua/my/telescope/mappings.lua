local sorters = require "telescope.sorters"

TelescopeMapArgs = TelescopeMapArgs or {}

local map_tele = function(key, f, options, buffer)
  local map_key = vim.api.nvim_replace_termcodes(key .. f, true, true, true)

  TelescopeMapArgs[map_key] = options or {}

  local mode = "n"
  local rhs = string.format("<cmd>lua R('my.telescope.handlers')['%s'](TelescopeMapArgs['%s'])<CR>", f, map_key)

  local map_options = {
    noremap = true,
    silent = true,
  }

  if not buffer then
    vim.api.nvim_set_keymap(mode, key, rhs, map_options)
  else
    vim.api.nvim_buf_set_keymap(0, mode, key, rhs, map_options)
  end
end

-- Search
map_tele("<space>gw", "grep_string", {
  short_path = true,
  word_match = "-w",
  only_sort_text = true,
  layout_strategy = "vertical",
  sorter = sorters.get_fzy_sorter(),
})

-- Files
map_tele("<space>ft", "git_files")
map_tele("<space>fg", "live_grep")
map_tele("<space>fd", "fd")
map_tele("<space>pp", "project_search")
map_tele("<space>fe", "file_browser")

-- Git 
map_tele("<space>gs", "git_status")
map_tele("<space>gc", "git_commits")

-- NVIM
map_tele("<space>fb", "buffers")
map_tele("<space>ff", "curbuf")
map_tele("<space>fh", "help_tags")

return map_tele
