augroup JsCommands 
  au!
  autocmd BufWritePost *.js :silent! PrettierAsync
augroup END
