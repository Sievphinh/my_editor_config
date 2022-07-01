--local M = {}
local opts = { noremap = true, silent = true }

local keymap = vim.api.nvim_set_keymap

-- remap Space as a leader key
keymap("", "<Space>", "<Nop>", opts)

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
-- n stands for normal mode
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Visual Mode
-- Indent line
-- v stands for visual mode
keymap("v", ">", ">gv", opts)
keymap("v", "<", "<gv", opts)

-- return M
