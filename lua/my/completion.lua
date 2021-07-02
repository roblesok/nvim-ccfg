vim.cmd [[set shortmess+=c]]

require'compe'.setup {
  enabled = true;
  autocomplete = true;
  debug = false;
  min_length = 1;
  preselect = 'enable';
  throttle_time = 80;
  source_timeout = 200;
  resolve_timeout = 800;
  max_abbr_width = 100;
  max_kind_width = 100;
  max_menu_width = 100;
  documentation = true;

  source = {
    path = true;
    buffer = false;
    calc = true;
    tags = true;
    nvim_lsp = true;
    nvim_lua = true;
    luasnip = true;
    treesitter = true;
  }
}

vim.cmd [[inoremap <silent><expr> <C-Space> compe#complete()]]
