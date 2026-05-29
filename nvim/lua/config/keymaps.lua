-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
-- Tabs
vim.keymap.set("n", "te", "<cmd>tabnew<cr>")
vim.keymap.set("n", "<tab>", "<cmd>tabnext<cr>")
vim.keymap.set("n", "<s-tab>", "<cmd>tabprevious<cr>")
vim.keymap.set("n", "tw", "<cmd>tabclose<cr>")
