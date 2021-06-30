local U = require('my.utils')

-- Copy to clipboard
U.vmap("<C-y>", [["+y]])
U.nmap("<C-y>", "<Cmd>lua require('my.utils').YankOneLine()<CR>")
U.nmap("<leader>yy", "<Cmd>%y+<CR>")

-- Paste from Clipboard
U.nmap("<C-p>", [["+p]])
U.vmap("<C-p>", [["+p]])

-- Windows
U.nmap("<leader>vs", "<Cmd>wincmd v<CR>")
U.nmap("<leader>hs", "<Cmd>wincmd s<CR>")
U.nmap("<C-o>", "<Cmd>wincmd o<CR>")
U.nmap("<C-h>", "<Cmd>wincmd h<CR>")
U.nmap("<C-j>", "<Cmd>wincmd j<CR>")
U.nmap("<C-k>", "<Cmd>wincmd k<CR>")
U.nmap("<C-l>", "<Cmd>wincmd l<CR>")

-- Omni
U.imap("<C-Space>", "<C-x><C-o>")

-- Fast Save
U.nmap("<leader>w", "<Cmd>:w!<CR>")

-- Close buffers
U.nmap("bd", "<Cmd>:bdelete<CR>")
U.nmap("bn", "<Cmd>:bnext<CR>")
