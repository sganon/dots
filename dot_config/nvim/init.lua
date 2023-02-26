require('plugins')
require('lsp')

vim.wo.number = true
vim.wo.relativenumber = true

require("catppuccin").setup({
	background = {
        	light = "latte",
        	dark = "mocha",
    	},
})

local dn = require('dark_notify')
dn.run({
    schemes = {
      dark  = {
	      colorscheme = "catppuccin-mocha",
	      background = "dark",
      },
      light = {
	      colorscheme = "catppuccin-latte",
	      background = "light",
      }
    },
})


function map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

require('horloge_nvim')

-- Telescope
local actions = require('telescope.actions')
require('telescope').setup{
  defaults = {
    file_ignore_patterns = {"./node_modules/*", "node_modules", "^node_modules/*", "node_modules/*"},
    mappings = {
      n = {
        ["q"] = actions.close
      },
    },
  }
}

-----------------------------------------------------------
--                    KEYBINDINGS                        --
-----------------------------------------------------------
-- Copy / Paste from and to system clipboard
map('v', '<leader>y', '"+y')
map('n', '<leader>p', '"+p')
map('n', '<leader>yy', '"+yy')

-- Telesecope
map('n', '<leader>ff', '<cmd>Telescope find_files<cr>')
map('n', '<leader>fg', '<cmd>Telescope live_grep<cr>')
map('n', '<leader>fb', '<cmd>Telescope buffers<cr>')
map('n', '<leader>fh', '<cmd>Telescope help_tags<cr>')


