-- set vim options here (vim.<first_key>.<second_key> = value)
return function(lvim)
  if vim.fn.has('wsl') == 1 then
    -- https://github.com/neovim/neovim/wiki/FAQ#how-to-use-the-windows-clipboard-from-wsl
    lvim.g.clipboard = {
      name = 'WslClipboard',
      copy = {
        ["+"] = 'clip.exe',
        ["*"] = 'clip.exe',
      },
      paste = {
        ["+"] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
        ["*"] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))'
      },
      cache_enabled = 0,
    }
  end
  return lvim
end
-- If you need more control, you can use the function()...end notation
-- return function(local_vim)
--   local_vim.opt.relativenumber = true
--   local_vim.g.mapleader = " "
--   local_vim.opt.whichwrap = vim.opt.whichwrap - { 'b', 's' } -- removing option from list
--   local_vim.opt.shortmess = vim.opt.shortmess + { I = true } -- add to option list
--
--   return local_vim
-- end
