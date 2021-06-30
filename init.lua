-- Basic Settings Without Plugins
require 'my.settings'

-- This Config uses packer as package manager
if require('my.firstload')() then
  return
end

-- Plugins
require('my.plugins')
