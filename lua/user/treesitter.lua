local status_ok, configs = pcall(require, "nvim-treesitter.configs")

if not status_ok then
  return
end

-- We need to add something later on maybe something relates to Typescript 
--
--
local ft_to_parser = require"nvim-treesitter.parsers".filetype_to_parsername
ft_to_parser.motoko = "typescript"

configs.setup({
  ensure_installed = "all", -- one of all languages or list of languages
  sync_install = false, -- install languages syncronously only apply to ensure_installed
  ignore_install = false, -- list of parsers to ignore installing
  highlight = {
    -- `false` will disable the whole extension
    enable = true,

    -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
    -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
    -- the name of the parser)
    -- list of language that will be disabled
    disable = { "css", "markdown" },

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    -- additional_vim_regex_highlighting = false,
  }, 
  -- Add autopairs, autotag, rainbow and indent later
  --
  -- 
  autopairs = {
		enable = true,
	},
  autotag = {
		enable = true,
		disable = { "xml" },
	},
  context_commentstring = {
		enable = true,
		enable_autocmd = false,
	},
  rainbow = {
		enable = true,
		colors = {
			"Gold",
			"Orchid",
			"DodgerBlue",
			"Cornsilk",
			"Salmon",
			"LawnGreen",
		},
		disable = { "html" },
	},
  playground = {
		enable = true,
	},
})


