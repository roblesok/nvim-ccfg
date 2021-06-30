local opt = vim.opt 
local cmd = vim.cmd
local exec = vim.api.nvim_exec

opt.encoding = "UTF-8"

opt.wildmode = { "longest", "list", "full" }
opt.completeopt = { "menuone", "noinsert", "noselect" }

opt.showmode = false
opt.showcmd = true
opt.incsearch = true -- Makes search act like search in modern browsers
opt.showmatch = true -- show matching brackets when text indicator is over them
opt.relativenumber = true -- show line numbers
opt.number = true -- show actual number for the current line
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true -- unless there is a capital letter in the query
opt.hidden = true -- buffers stay around
opt.cursorline = true -- hl current line
opt.colorcolumn = { 80 }
opt.updatetime = 1000 -- make updates happen faster
opt.hlsearch = false -- 
opt.scrolloff = 8 -- 8 lines below my cursor
opt.signcolumn = "yes"
opt.background = "dark"
opt.termguicolors = true

-- TABS
opt.autoindent = true
opt.cindent = true
opt.wrap = true

opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2
opt.expandtab = true

opt.swapfile = false
opt.backup = false
