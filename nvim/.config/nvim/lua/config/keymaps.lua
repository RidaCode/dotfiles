-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Space f d - dotfiles picker
vim.keymap.set("n", "<leader>fd", function()
  Snacks.picker.files({
    cwd = vim.fn.expand("~/dotfiles"),
    hidden = true,
    exclude = { ".git" },
    title = "Dotfiles",
  })
end, { desc = "Dotfiles" })
