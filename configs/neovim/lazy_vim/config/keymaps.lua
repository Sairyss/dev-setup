-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local keymap = vim.api.nvim_set_keymap

keymap("n", "<leader>t", ":ToggleTerm<CR>", { desc = "Toggle terminal", noremap = true, silent = true })
keymap("n", "<C-m>", "<cmd>lua vim.lsp.buf.code_action()<CR>", { desc = "Code action", noremap = true, silent = true })
keymap("n", "<F2>", "<cmd>lua vim.lsp.buf.rename()<CR>", { desc = "Rename", noremap = true, silent = true })
keymap("n", "<C-p>", "<cmd>Telescope find_files<CR>", { desc = "Find files", noremap = true, silent = true })
keymap("i", "<C-p>", "<cmd>Telescope find_files<CR>", { desc = "Find files", noremap = false, silent = true })
keymap("n", "<C-M-a>", "ggVG", { desc = "Select all text", noremap = false, silent = true })
keymap("n", "<C-S-f>", ":Spectre<CR>", { desc = "Find and replace (Spectre)", noremap = true, silent = true })
-- keymap("n", "<leader>a", ":AerialToggle<CR>", { desc = "Buffer symbols (Aerial)", noremap = true, silent = true })
-- keymap("n", "<C-_>", ":help<CR>", { desc = "Comment line", noremap = true, silent = true })

-- Harpoon keymaps
keymap(
  "n",
  "<M-s>",
  ':lua require("harpoon.mark").add_file()<CR>',
  { desc = "Harpoon mark file", noremap = false, silent = true }
)
keymap(
  "n",
  "<M-d>",
  ':lua require("harpoon.ui").toggle_quick_menu()<CR>',
  { desc = "Toggle show marked files", noremap = false, silent = true }
)
keymap(
  "n",
  "<M-q>",
  ':lua require("harpoon.ui").nav_file(1)<CR>',
  { desc = "Switch to marked file 1", noremap = false, silent = true }
)
keymap(
  "n",
  "<M-w>",
  ':lua require("harpoon.ui").nav_file(2)<CR>',
  { desc = "Switch to marked file 2", noremap = false, silent = true }
)
keymap(
  "n",
  "<M-e>",
  ':lua require("harpoon.ui").nav_file(3)<CR>',
  { desc = "Switch to marked file 3", noremap = false, silent = true }
)
keymap(
  "n",
  "<M-r>",
  ':lua require("harpoon.ui").nav_file(4)<CR>',
  { desc = "Switch to marked file 4", noremap = false, silent = true }
)
keymap(
  "n",
  "<M-t>",
  ':lua require("harpoon.ui").nav_file(5)<CR>',
  { desc = "Switch to marked file 5", noremap = false, silent = true }
)
