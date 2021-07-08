local lspconfig = require('lspconfig')
local common = require('my.lsp.common')

require'my.lsp.handlers'
if pcall(require, 'lspkind') then
  require'lspkind'.init({})
end

local updated_capabilities = vim.lsp.protocol.make_client_capabilities()
updated_capabilities.textDocument.codeLens = {
  dynamicRegistration = false
}
updated_capabilities.textDocument.completion.completionItem.snippetSupport = true

local servers = {
  'rust_analyzer',
  'gopls',
  'tsserver',
  'vimls',
  'bashls',
  'pyright',
}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = common.on_attach,
    on_init = common.on_init,
    capabilities = updated_capabilities,
  }
end

-- FLUTTER
local has_flutter_tools, ftools = pcall(require, "flutter-tools")
if has_flutter_tools then
  ftools.setup {
    -- disable autostart dev tools
    dev_tools = {
      autostart = false,
      auto_open_browser = false,
    },
    -- open log
    dev_log = {
      open_cmd = 'tabedit',
    },
    -- experimental
    widget_guides = { 
      enabled = true
    },
    lsp = {
      on_init = common.on_init,
      on_attach = common.on_attach,
      capabilities = updated_capabilities,
    }
  }
end
