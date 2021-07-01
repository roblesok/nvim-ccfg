vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    signs = true,
    underline = true,
    virtual_text = false
  }
)

-- Uses lspsaga Hover
local has_saga = pcall(require, 'lspsaga')
if not has_saga then
  return
end
vim.lsp.handlers["textDocument/hover"] = require("lspsaga.hover").handler

-- Custom Rename
local ns_rename = vim.api.nvim_create_namespace "my_rename"
function MyRename()
  local bufnr = vim.api.nvim_get_current_buf()
  vim.api.nvim_buf_clear_namespace(bufnr, ns_rename, 0, -1)

  local current_word = vim.fn.expand "<cword>"

  local saga = require'lspsaga.rename'
  local line, col = vim.fn.line ".", vim.fn.col "."
  local contents = vim.api.nvim_buf_get_lines(bufnr, line - 1, line, false)[1]

  local has_found_hl, start, finish = false, 0, -1
  while not has_found_hl do 
    start, finish = contents:find(current_word, start + 1, true)

    if not start or not finish then
      break
    end 

    if start <= col and finish >= col then
      has_found_hl = true
    end
  end

  if has_found_hl then
    vim.api.nvim_buf_add_highlight(bufnr, ns_rename, "Visual", line - 1, start - 1, finish)
    vim.cmd(
      string.format(
        "autocmd BufEnter <buffer=%s> ++once :call nvim_buf_clear_namespace(%s, %s, 0, -1)",
        bufnr,
        bufnr,
        ns_rename
      )
    )
  end

  saga.rename()

  -- Make escape quit
  vim.api.nvim_buf_set_keymap(
    0,
    'n',
    "<esc>",
    '<Cmd>lua require("lspsaga.rename").close_rename_win()<CR>',
    {noremap = true, silent = true}
  )
  return
end
