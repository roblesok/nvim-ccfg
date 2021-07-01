local should_reload = true 
local reloader = function()
  if should_reload then
    RELOAD "plenary"
    RELOAD "popup"
    RELOAD "telescope"
  end
end

local themes = require'telescope.themes'

local M = {}

function M.fd()
  require('telescope.builtin').fd()
end

function M.builtin() 
  require('telescope.builtin').builtin()
end

function M.git_files()
  local path = vim.fn.expand "%:h"

  local opts = themes.get_dropdown {
    winblend = 5,
    previewer = false,
    shorten_path = false,
    cwd = path,
    layoud_config = {
      width = 0.25
    }
  }
  require('telescope.builtin').git_files(opts)
end

function M.buffer_git_files()
  require('telescope.builtin').git_files(themes.get_dropdown {
    cwd = vim.fn.expand  "%:p:h",
    winblend = 10,
    border = true,
    previewer = false,
    shorten_path = false,
  })
end

function M.live_grep()
  require('telescope').extensions.fzf_writer.staged_grep {
    shorten_path = true,
    previewer = false,
    fzf_separator = "|>",
  }
end

function M.buffers()
  require('telescope.builtin').buffers {
    shorten_path = false,
  }
end

function M.curbuf()
  local opts = themes.get_dropdown {
    winblend = 10,
    border = true,
    previewer = false,
    shorten_path = false,
  }
  require('telescope.builtin').current_buffer_fuzzy_find(opts)
end

function M.help_tags()
  require('telescope.builtin').help_tags {
    show_version = true
  }
end

function M.file_browser()
  local opts = {
    sorting_strategy = "ascending",
    scroll_strategy = "cycle",
  }
  require("telescope.builtin").file_browser(opts)
end

function M.git_status()
  local opts = themes.get_dropdown {
    winblend = 10,
    border = true,
    previewer = false,
    shorten_path = false,
  }
  require('telescope.builtin').git_status(opts)
end

function M.git_commits()
  require('telescope.builtin').git_commits {
    winblend = 5,
  }
end

function M.lsp_code_actions()
  local opts = themes.get_dropdown {
    winblend = 10,
    border = true,
    previewer = false,
    shorten_path = false,
  }
  require('telescope.builtin').lsp_code_actions(opts)
end 

function M.project_search()
  require('telescope.builtin').find_files {
    previewer = false,
    layout_strategy = "vertical",
    cwd = require('lspconfig.util').root_pattern '.git'(vim.fn.expand "%:p"),
  }
end

function M.flutter_commands()
  require('telescope').extensions.flutter.commands()
end

return setmetatable({}, {
  __index = function(_, k)
    reloader()

    if M[k] then
      return M[k]
    else 
      return require("telescope.builtin")[k]
    end
  end,
})
