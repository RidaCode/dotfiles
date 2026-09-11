-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- Use Neovim's native gutter in :Tutor so exercise ✓ / ✗ signs are visible
local tutor_group = vim.api.nvim_create_augroup("TutorSigns", { clear = true })

vim.api.nvim_create_autocmd("FileType", {
  group = tutor_group,
  pattern = "tutor",
  callback = function()
    vim.opt_local.statuscolumn = ""
    vim.opt_local.signcolumn = "yes"
  end,
})
