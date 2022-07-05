local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim',
    install_path })
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
  use "lukas-reineke/indent-blankline.nvim"
  use { "akinsho/toggleterm.nvim", tag = 'v1.*', config = function()
    require("toggleterm").setup()
  end }
  use {
    'kdheepak/tabline.nvim',
    config = function()
      require 'tabline'.setup {
        -- Defaults configuration options
        enable = true,
        options = {
          -- If lualine is installed tabline will use separators configured in lualine by default.
          -- These options can be used to override those settings.
          section_separators = { '', '' },
          component_separators = { '', '' },
          max_bufferline_percent = 66, -- set to nil by default, and it uses vim.o.columns * 2/3
          show_tabs_always = false, -- this shows tabs only when there are more than one tab or if the first tab is named
          show_devicons = true, -- this shows devicons in buffer section
          show_bufnr = false, -- this appends [bufnr] to buffer section,
          show_filename_only = false, -- shows base filename only instead of relative path in filename
          modified_icon = "+ ", -- change the default modified icon
          modified_italic = false, -- set to true by default; this determines whether the filename turns italic if modified
          show_tabs_only = false, -- this shows only tabs instead of tabs + buffers
        }
      }
      vim.cmd [[
      set guioptions-=e " Use showtabline in gui vim
      set sessionoptions+=tabpages,globals " store tabpages and globals in session
    ]]
    end,
    requires = { { 'hoob3rt/lualine.nvim', opt = true }, { 'kyazdani42/nvim-web-devicons', opt = true } }
  }
  -- cmp
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-buffer"
  use "hrsh7th/cmp-path"
  use "hrsh7th/cmp-cmdline"
  use "hrsh7th/nvim-cmp"
  use "saadparwaiz1/cmp_luasnip"
  use "L3MON4D3/LuaSnip"
  use "rafamadriz/friendly-snippets"
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
  -- LSP
  use "neovim/nvim-lspconfig"
  use "williamboman/nvim-lsp-installer"
  use "onsails/lspkind-nvim"
  use "jose-elias-alvarez/null-ls.nvim"
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
  -- snippets
  -- UI
  use "rcarriga/nvim-notify"
  -- Rust
  -- need to add crates and rust tools
  -- UI
  use { "stevearc/dressing.nvim" }
  -- use "ghillb/cybu.nvim"
  -- use "tversteeg/registers.nvim"
  -- use "rcarriga/nvim-notify"
  -- use "kyazdani42/nvim-web-devicons"
  -- use "kyazdani42/nvim-tree.lua"
  -- use "tamago324/lir.nvim"
  use "goolord/alpha-nvim"
  -- use "folke/which-key.nvim"
  -- use "folke/zen-mode.nvim"
  use "karb94/neoscroll.nvim"
  -- use "folke/todo-comments.nvim"
  -- use "andymass/vim-matchup"
  -- Git
  -- Markdown preview plugin
  -- install without yarn or npm

  -- use({ "iamcco/markdown-preview.nvim", run = "cd app && npm install", setup = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" }, })
  -- use "davidgranstrom/nvim-markdown-preview"
  use {

    "iamcco/markdown-preview.nvim",
    run = "cd app && npm install",
    ft = "markdown",
  }
  if packer_bootstrap then
    require('packer').sync()
  end
end)
