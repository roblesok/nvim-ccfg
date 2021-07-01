local cmd = vim.cmd
local exec = vim.api.nvim_exec 

-- Basic Theme
exec(
[[
  augroup MyTheme
    au!
    au ColorScheme * hi! clear CursorLine
    au ColorScheme * hi! CursorLine gui=underline guisp=#243447 
    au ColorScheme * hi! ColorColumn guibg=#243447
  augroup END
]], false)

-- Illuminate
exec(
[[
  augroup Illuminate_augroup
    au!
    au VimEnter * hi illuminatedWord cterm=underline gui=underline
  augroup END
]], false)

cmd([[colorscheme night-owl]])
