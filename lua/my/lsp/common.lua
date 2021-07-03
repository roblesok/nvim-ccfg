local common = {}

local telescope_mapper = require('my.telescope.mappings')

local function buf_set_keymap(...)
  vim.api.nvim_buf_set_keymap(bufnr, ...)
end

local function buf_set_option(...)
  vim.api.nvim_buf_set_option(bufnr, ...)
end

function common.on_attach(client, bufnr) 
  local filetype = vim.api.nvim_buf_get_option(0, 'filetype')

  if pcall(require, 'lsp_signature') then
    require'lsp_signature'.on_attach({
      bind = true,
      doc_lines = 2,
      use_lspsaga = pcall(require, 'lspsaga'),
    })
  end

  -- Status
  local has_status, lspstatus = pcall(require, 'lsp-status')
  if has_status then
    lspstatus.on_attach(client)
    lspstatus.register_progress()
  end

  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings
  local opts = {noremap = true, silent = true}
  -- Diagnostics
  buf_set_keymap('n', 'dn', '<Cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', 'dp', '<Cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', 'dl', '<Cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  -- Code & Documentation
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', "<Cmd>lua vim.lsp.buf.hover()<CR>", opts)
  buf_set_keymap('n', 'gi', '<Cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<Cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  -- Actions
  buf_set_keymap('n', '<space>rn', "<Cmd>lua MyRename()<CR>", opts)
  telescope_mapper("<space>ca", "lsp_code_actions", nil, true)
  -- Formatting
  if client.resolved_capabilities.document_formatting then
    buf_set_keymap('n', '<leader>ff', '<Cmd>lua vim.lsp.buf.formatting()<CR>', opts)
  elseif client.resolved_capabilities.document_range_formatting then
    buf_set_keymap('n', '<leader>ff', '<Cmd>lua vim.lsp.buf.range_formatting()<CR>', opts)
  end

  -- specific langs
  if filetype == 'dart' then
    telescope_mapper('<space>ft', 'flutter_commands', nil, true)
  end

end

function common.on_init(client) 
  client.config.flags = client.config.flags or {}
  client.config.flags.allow_incremental_sync = true
end

return common
