-- Ask for download packer and install
local download_packer = function()
  if vim.fn.input "Packer is required. Download? (y|n)" ~= "y" then
    return
  end

  local dir = string.format("%s/site/pack/packer/start/", vim.fn.stdpath "data")

  vim.fn.mkdir(dir, "p")
  local packerrepo = "https://github.com/wbthomason/packer.nvim"
  local out = vim.fn.system(
    string.format("git clone %s %s", packerrepo, dir .. "/packer.nvim"))
  print(out)
  print "Downloading packer.nvim"
  print "Please restart nvim!"
end

return function()
  -- Check if packer is installed
  if not pcall(require, "packer") then
    download_packer()
    return true
  end
  return false
end
