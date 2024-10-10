vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Ctrl-c to escape
vim.keymap.set("i", "<C-c>", "<Esc>")

-- Noop on Q, which is so annoying
vim.keymap.set("n", "Q", "<nop>")
