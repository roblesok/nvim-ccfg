local U = {}
local fn = vim.fn

-- Key mapping
function U.map(mode, key, action, opts) 
  opts = vim.tbl_extend('keep', opts or {},
                        {noremap = true, silent = true, expr = false})
  vim.api.nvim_set_keymap(mode, key, action, opts)
end

function U.nmap(key, action, opts)
  U.map('n', key, action, opts)
end

function U.vmap(key, action, opts)
  U.map('v', key, action, opts)
end

function U.imap(key, action, opts)
  U.map('i', key, action, opts)
end

function U.YankOneLine()
  fn.setreg("+", fn.trim(fn.getline('.')))
  print("[YankOneLine] one line yanked to system clipboard")
end

return U
