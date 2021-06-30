-- Basic Settings Without Plugins
require 'my.settings'

-- This Config uses packer as package manager
if require('my.firstload')() then
  print "Packer is required! Visit https://github.com/wbthomason/packer.nvim"
  return
end

-- Plugins
require('my.plugins')
