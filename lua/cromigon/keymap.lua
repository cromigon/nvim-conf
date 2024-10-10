vim.g.mapleader = " "
-- Ctrl-c to escape
vim.keymap.set("i", "<C-c>", "<Esc>")

-- Noop on Q, which is so annoying
vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "q", "<nop>")
