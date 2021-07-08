require('el').setup {
  generator = function(win_id)
    local extensions = require('el.extensions')
    local builtin = require('el.builtin')
    local sections = require('el.sections')
    local lsp_status_line = require('el.plugins.lsp_status')
    local subscribe = require('el.subscribe')
    local el_segments = {}
    -- [MODE]
    table.insert(el_segments, extensions.mode)
    -- [FILE NAME]
    table.insert(el_segments, ' [ %f ]')
    table.insert(el_segments, sections.split)
    -- [DIAGNOSTIC]
    table.insert(el_segments, lsp_status_line.segment)
    --
    -- [LINE/COLUMN]
    local line_col = string.format("[%s:%s]", builtin.line, builtin.column)
    table.insert(el_segments, line_col)
    -- [FILE TYPE]
    table.insert(el_segments, builtin.filetype)
    -- [BRANCH]
    table.insert(
      el_segments, 
      subscribe.buf_autocmd(
      "el_git_branch",
      "BufEnter",
      function(window, buffer)
        return string.format('[branch:%s]', extensions.git_branch(window, buffer))
      end
    ))
    return el_segments
  end
}
