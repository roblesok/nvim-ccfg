-- Basic Settings Without Plugins
require 'my.settings'

-- Set leader key before mappings
vim.g.mapleader = ','
-- Load some key bindings that do not need plugins
require 'my.kbinding'

-- This Config uses packer as package manager
if require('my.firstload')() then
  return
end

-- Plugins
require('my.plugins')
