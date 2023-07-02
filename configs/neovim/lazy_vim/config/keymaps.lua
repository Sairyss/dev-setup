-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local keymap = vim.api.nvim_set_keymap

keymap("n", "<leader>t", ":ToggleTerm<CR>", { desc = "Toggle terminal", noremap = true, silent = true })
keymap("n", "<C-m>", "<cmd>lua vim.lsp.buf.code_action()<CR>", { desc = "Code action", noremap = true, silent = true })
keymap("n", "<F2>", "<cmd>lua vim.lsp.buf.rename()<CR>", { desc = "Rename", noremap = true, silent = true })
keymap("n", "<C-p>", "<cmd>Telescope find_files<CR>", { desc = "Find files", noremap = true, silent = true })
keymap("i", "<C-p>", "<cmd>Telescope find_files<CR>", { desc = "Find files", noremap = false, silent = true })
keymap("n", "<C-a>", "ggVG", { desc = "Select all text", noremap = false, silent = true })
keymap("n", "<C-S-f>", ":Spectre<CR>", { desc = "Find and replace (Spectre)", noremap = true, silent = true })
-- keymap("n", "<leader>a", ":AerialToggle<CR>", { desc = "Buffer symbols (Aerial)", noremap = true, silent = true })
-- keymap("n", "<C-_>", ":help<CR>", { desc = "Comment line", noremap = true, silent = true })
