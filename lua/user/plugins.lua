local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

return require('packer').startup(function(use)
  -- My plugins here
  -- use 'foo1/bar1.nvim'
  -- use 'foo2/bar2.nvim'

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  use "wbthomason/packer.nvim" -- Have packer manage itself
  use {
  'kyazdani42/nvim-tree.lua',
  requires = {
    'kyazdani42/nvim-web-devicons', -- optional, for file icons
  },
  tag = 'nightly' -- optional, updated every week. (see issue #1193)
}
  use "norcalli/nvim-colorizer.lua" -- show color
  use "nacro90/numb.nvim" -- peeks lines of the buffer
  use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins
  use "windwp/nvim-autopairs" -- Autopairs, integrates with both cmp and treesitter
  use "numToStr/Comment.nvim" -- Comment 
  use {
  'nvim-lualine/lualine.nvim',
  requires = { 'kyazdani42/nvim-web-devicons', opt = true }
}
  use "akinsho/toggleterm.nvim"
  -- Nvim-tree
  use "kyazdani42/nvim-web-devicons"
  use "folke/which-key.nvim"
  -- colorscheme
  use "ellisonleao/gruvbox.nvim"
   -- Telescope
  use "nvim-telescope/telescope.nvim"
  use "tom-anders/telescope-vim-bookmarks.nvim"
  use "nvim-telescope/telescope-media-files.nvim"
  -- Treesitter
  use { "nvim-treesitter/nvim-treesitter" }
  use "JoosepAlviste/nvim-ts-context-commentstring"
  use { "p00f/nvim-ts-rainbow" }
  use "nvim-treesitter/playground"
  use "windwp/nvim-ts-autotag"
  -- cmp plugins
   use { "hrsh7th/nvim-cmp" }
  use "hrsh7th/cmp-buffer" -- buffer completions
  use "hrsh7th/cmp-path" -- path completions
  use "hrsh7th/cmp-cmdline" -- cmdline completions
  use "saadparwaiz1/cmp_luasnip" -- snippet completions
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-emoji"
  use "hrsh7th/cmp-nvim-lua"
  use {
    "tzachar/cmp-tabnine",
    run = "./install.sh",
    requires = "hrsh7th/nvim-cmp",
  }
  -- LSP
  use "neovim/nvim-lspconfig" -- enable LSP
  use "williamboman/nvim-lsp-installer" -- simple to use language server installer
  use "jose-elias-alvarez/null-ls.nvim" -- for formatters and linters
  use "simrat39/symbols-outline.nvim"
  use "ray-x/lsp_signature.nvim"
  use "b0o/SchemaStore.nvim"
  use {
    "folke/trouble.nvim",
    cmd = "TroubleToggle",
  }
  -- use "github/copilot.vim"
  --[[ use {
    "zbirenbaum/copilot.lua",
    event = { "VimEnter" },
    config = function()
      vim.defer_fn(function()
        require "user.copilot"
      end, 100)
    end,
  }
  use {
    "zbirenbaum/copilot-cmp",
    module = "copilot_cmp",
  } ]]
  use "RRethy/vim-illuminate"
  -- snippets
  use "L3MON4D3/LuaSnip" --snippet engine
  use "rafamadriz/friendly-snippets" -- a bunch of snippets to use
  -- UI
  use "rcarriga/nvim-notify"
  -- Rust 
  -- need to add crates and rust tools
  -- UI
  -- use { "stevearc/dressing.nvim" }
  -- use "ghillb/cybu.nvim"
  -- use { "christianchiarulli/nvim-gps", branch = "text_hl" }
  -- use "tversteeg/registers.nvim"
  -- use "rcarriga/nvim-notify"
  -- use "kyazdani42/nvim-web-devicons"
  -- use "kyazdani42/nvim-tree.lua"
  -- use "tamago324/lir.nvim"
  use "goolord/alpha-nvim"
  -- use "folke/which-key.nvim"
  -- use "folke/zen-mode.nvim"
  -- use "karb94/neoscroll.nvim"
  -- use "folke/todo-comments.nvim"
  -- use "andymass/vim-matchup"
  -- Git
  use "lewis6991/gitsigns.nvim"
  use "f-person/git-blame.nvim"
  use "ruifm/gitlinker.nvim"
  use "mattn/vim-gist"
  use "mattn/webapi-vim"

    if packer_bootstrap then
      require('packer').sync()
    end
end)
