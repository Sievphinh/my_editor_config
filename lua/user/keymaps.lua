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
-- Resize window
keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)
-- Buffer keymap
keymap("n", "<Tab>", ":TablineBufferNext<cr>", opts)
keymap("n", "<S-Tab>", ":TablineBufferPrevious<cr>", opts)
keymap("n", "bd", ":bdelete<cr>", opts)
-- Visual Mode
-- Indent line
-- v stands for visual mode
keymap("v", ">", ">gv", opts)
keymap("v", "<", "<gv", opts)

-- move text up and down
keymap("v", "<A-k>", ":m .+1<CR>==", opts) 
keymap("v", "<A-j>", ":m .-2<CR>==", opts) 
--visual block
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- return M
