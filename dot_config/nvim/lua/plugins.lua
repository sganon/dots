local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
		vim.cmd [[packadd packer.nvim]]
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

require('packer').startup(function(use)
	use 'wbthomason/packer.nvim' -- Package manager
	use 'neovim/nvim-lspconfig' -- Configurations for Nvim LSP
	use 'wakatime/vim-wakatime'
	use 'mattn/emmet-vim'

	use {
		'hrsh7th/nvim-cmp',
		requires = {
			{'saadparwaiz1/cmp_luasnip'},
			{'hrsh7th/cmp-nvim-lsp'},
			{'hrsh7th/cmp-buffer'},
			{'hrsh7th/cmp-path'},
			{'hrsh7th/cmp-cmdline'},	
			-- nvim-cmp depends on a snippet engine
			-- here we use snippy
			{'dcampos/nvim-snippy'},
			{'honza/vim-snippets'},
			{'dcampos/cmp-snippy'}
		}
	}

	use {
		'nvim-treesitter/nvim-treesitter'
	}

	use {
		"pmizio/typescript-tools.nvim",
		requires = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
	}


	-- themes
	use { "catppuccin/nvim", as = "catppuccin" }
	use { 'sthendev/mariana.vim', run='make' }
	use { "kaiuri/nvim-juliana" }
	use { 'projekt0n/caret.nvim' }

	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.1',
		requires = { {'nvim-lua/plenary.nvim'} }
	}
	use 'gbrlsnchs/telescope-lsp-handlers.nvim'

	use 'christoomey/vim-tmux-navigator'

	use 'cormacrelf/dark-notify'

	use 'shortcuts/no-neck-pain.nvim'

	use 'echasnovski/mini.files'
end)
