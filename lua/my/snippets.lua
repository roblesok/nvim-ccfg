local ls = require('luasnip')
local s = ls.s
local t = ls.t
local i = ls.i
local U = require('my.utils')

vim.g.snippets = 'luasnip'

U.imap("<C-l>", "<Cmd>lua require('luasnip').expand_or_jump()<CR>")

local s = ls.snippet

ls.config.set_config({
  history = true,
  updateevents = "TextChanged, TextChangedI",
})

local str_snip = function(trig, expanded)
  return ls.parser.parse_snippet({ trig = trig, wordTrig = true }, expanded)
end

local neg = function(fn, ...)
  return not fn(...)
end

local char_count_same = function(c1, c2)
  local line = vim.api.nvim_get_current_line()
  local _, ct1 = string.gsub(line, c1, '')
  local _, ct2 = string.gsub(line, c2, '')
  return ct1 == ct2
end


ls.snippets = {
  all = {
    str_snip("todo", "// TODO: $1") 
  },
  -- rust = {
  --   str_snip("fn", "/// $1\nfn $2($3) ${4:-> $5 }\\{\n\t$0\n\\}"),
  --   str_snip("format", "format!(\"$1\", $2)"),
  -- },
  -- go = {
  --   str_snip("err", "if err != nil \\{\n\t$0\n\\}"),
  --   str_snip("fp", "fmt.Println(\"$1\")"),
  --   str_snip("ff", "fmt.Printf(\"$1\", ${2:var})"),
  -- }
}

local vsnips = vim.fn.expand "~/.config/nvim/snips"
require('luasnip/loaders/from_vscode').load({ paths = { vsnips } })
