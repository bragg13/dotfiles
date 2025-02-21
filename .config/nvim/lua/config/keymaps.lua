-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local keymap = vim.keymap
local opts = { noremap = true, silent = true }

keymap.set("n", "x", '"_x')
keymap.set("n", "c", '"_c')

-- New tab
keymap.set("n", "te", ":tabedit ")

-- Close buffer
keymap.set("n", "<leader>qw", "<leader>bd")

-- insert blank line with CR
keymap.set("n", "<CR>", '@="m`o<C-V><Esc>``"<CR>')

-- Select all
keymap.set("n", "<C-a>", "gg<S-v>G")

-- Save with leader w
keymap.set("n", "<Leader>w", ":w<Return>")

-- remap undo
-- keymap.set("n", "<BS>", "u")
-- keymap.set("n", "u", "k")

-- faster movement
keymap.set("n", "J", "8j")
keymap.set("n", "U", "8k")

-- faster pasting to replace a word
keymap.set("n", "vv", "vep")
