{ config, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "sganon";
  home.homeDirectory = "/home/sganon";
  home.sessionPath = ["~/go/bin"];

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "21.05";

  home.packages = [
    pkgs.htop
    pkgs.bitwarden-cli
    pkgs.chezmoi
    pkgs.nodejs
    pkgs.yarn
    pkgs.gnumake
    pkgs.jq
    pkgs.zip
    pkgs.unzip
    pkgs.neofetch
    pkgs.gnupg
    pkgs.pinentry-qt
    pkgs.gopls
    pkgs.cmake
    pkgs.gcc
    pkgs.latte-dock
    pkgs.vault
    pkgs.openssl
    pkgs.killall
    pkgs.mysql
    pkgs.sass
  ];

  programs.neovim = {
    enable = true;
    plugins = with pkgs.vimPlugins; [
      vim-nix
      vim-go
      lightline-vim
      vim-jsx-typescript
      emmet-vim
      coc-nvim
      coc-json
      coc-go
      coc-emmet
      coc-html
      coc-eslint
      vim-lightline-coc
      coc-highlight
      coc-css
      coc-python
      coc-rls
      coc-tslint-plugin
      coc-tsserver
      Spacegray-vim
    ];
    vimAlias = true;
    viAlias = true;
    extraConfig = ''
      colorscheme spacegray

      set nu
	  set colorcolumn=80,120
	  highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
	  match ExtraWhitespace /\s\+$/

	  filetype plugin indent on
	  " show existing tab with 4 spaces width
	  set tabstop=4
	  " when indenting with '>', use 4 spaces width
	  set shiftwidth=4
	  " On pressing tab, insert 4 spaces
	  set expandtab

	  " " Copy to clipboard
	  vnoremap  <leader>y  "+y
	  nnoremap  <leader>Y  "+yg_
	  nnoremap  <leader>y  "+y
	  nnoremap  <leader>yy  "+yy

	  " " Paste from clipboard
	  nnoremap <leader>p "+p
	  nnoremap <leader>P "+P
	  vnoremap <leader>p "+p
	  vnoremap <leader>P "+P

	  " Replace All, place cursor on var, \R, new var, enter
	  nnoremap <leader>R yiw:%s/\<<C-r>"\>//g<left><left>

	  silent! nmap <C-p> :NERDTreeToggle<CR>
	  silent! map <F3> :NERDTreeFind<CR>
	  let g:NERDTreeMapActivateNode="<F3>"
	  let g:NERDTreeMapPreview="<F4>"

	  hi Normal guibg=NONE ctermbg=NONE

	  nmap <leader>rn <Plug>(coc-rename)
	  " TextEdit might fail if hidden is not set.
	  set hidden
	  " Some servers have issues with backup files, see #649.
	  set nobackup
	  set nowritebackup
	  " Give more space for displaying messages.
	  set cmdheight=2
	  " Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
	  " delays and poor user experience.
	  set updatetime=300
	  " Don't pass messages to |ins-completion-menu|.
	  set shortmess+=c
	  " Always show the signcolumn, otherwise it would shift the text each time
	  " diagnostics appear/become resolved.
	  set signcolumn=yes
	  " Use tab for trigger completion with characters ahead and navigate.
	  " NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
	  " other plugin before putting this into your config.
	  inoremap <silent><expr> <TAB>
	        \ pumvisible() ? "\<C-n>" :
	        \ <SID>check_back_space() ? "\<TAB>" :
	        \ coc#refresh()
	  inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

	  function! s:check_back_space() abort
	    let col = col('.') - 1
	    return !col || getline('.')[col - 1]  =~# '\s'
	  endfunction

	  " Use `[g` and `]g` to navigate diagnostics
	  nmap <silent> [g <Plug>(coc-diagnostic-prev)
	  nmap <silent> ]g <Plug>(coc-diagnostic-next)

	  " GoTo code navigation.
	  nmap <silent> gd <Plug>(coc-definition)
	  nmap <silent> gy <Plug>(coc-type-definition)
	  nmap <silent> gi <Plug>(coc-implementation)
	  nmap <silent> gr <Plug>(coc-references)

	  " Use K to show documentation in preview window.
	  nnoremap <silent> K :call <SID>show_documentation()<CR>

	  function! s:show_documentation()
	    if (index(['vim','help'], &filetype) >= 0)
	      execute 'h '.expand('<cword>')
	    else
	      call CocAction('doHover')
	    endif
	  endfunction

	  " Highlight the symbol and its references when holding the cursor.
	  autocmd CursorHold * silent call CocActionAsync('highlight')

	  " Symbol renaming.
	  nmap <leader>rn <Plug>(coc-rename)

	  " Formatting selected code.
	  xmap <leader>f  <Plug>(coc-format-selected)
	  nmap <leader>f  <Plug>(coc-format-selected)

	  augroup mygroup
	    autocmd!
	    " Setup formatexpr specified filetype(s).
	    autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
	    " Update signature help on jump placeholder.
	    autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
	  augroup end

	  " Applying codeAction to the selected region.
	  " Example: `<leader>aap` for current paragraph
	  xmap <leader>a  <Plug>(coc-codeaction-selected)
	  nmap <leader>a  <Plug>(coc-codeaction-selected)

	  " Remap keys for applying codeAction to the current line.
	  nmap <leader>ac  <Plug>(coc-codeaction)
	  " Apply AutoFix to problem on the current line.
	  nmap <leader>qf  <Plug>(coc-fix-current)

	  " Introduce function text object
	  " NOTE: Requires 'textDocument.documentSymbol' support from the language server.
	  xmap if <Plug>(coc-funcobj-i)
	  xmap af <Plug>(coc-funcobj-a)
	  omap if <Plug>(coc-funcobj-i)
	  omap af <Plug>(coc-funcobj-a)

	  " Use <TAB> for selections ranges.
	  " NOTE: Requires 'textDocument/selectionRange' support from the language server.
	  " coc-tsserver, coc-python are the examples of servers that support it.
	  nmap <silent> <TAB> <Plug>(coc-range-select)
	  xmap <silent> <TAB> <Plug>(coc-range-select)

	  " Add `:Format` command to format current buffer.
	  command! -nargs=0 Format :call CocAction('format')

	  " Add `:Fold` command to fold current buffer.
	  command! -nargs=? Fold :call     CocAction('fold', <f-args>)

	  " Add `:OR` command for organize imports of the current buffer.
	  command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

	  " Mappings using CoCList:
	  " Show all diagnostics.
	  nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
	  " Manage extensions.
	  nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
	  " Show commands.
	  nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
	  " Find symbol of current document.
	  nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
	  " Search workspace symbols.
	  nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
	  " Do default action for next item.
	  nnoremap <silent> <space>j  :<C-u>CocNext<CR>
	  " Do default action for previous item.
	  nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
	  " Resume latest coc list.
	  nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
    '';
  };

  programs.alacritty = {
    enable = true;
    settings = {
      font = {
        normal = {
          family = "JetBrainsMono Nerd Font";
	  style = "Regular";
	};
        bold = {
          family = "JetBrainsMono Nerd Font";
	  style = "Bold";
	};
        italic = {
          family = "JetBrainsMono Nerd Font";
	  style = "Italic";
	};
        bold_italic = {
          family = "JetBrainsMono Nerd Font";
	  style = "Bold Italic";
	};
	size = 10.0;
      };
      shell = { program = "tmux"; };
    };
  };

  programs.git = {
    enable = true;
    userName = "Simon GANON";
    userEmail = "simon.ganon@channeladvisor.com";
    signing = {
      key = "205B92BD8825898C";
      signByDefault = true;
    };
    extraConfig = {
      pull = { rebase = true; };
      url = {
        "ssh://git@git.blueboard.io/" = { insteadOf = "https://git.blueboard.io/"; };
        "ssh://git@git.y2m.io/" = { insteadOf = "https://git.y2m.io/"; };
      };
    };
  };

  programs.go.enable = true;

  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    oh-my-zsh = {
      enable = true;
      plugins = [ "git" "python" "man" "docker" ];
      theme = "flazz";
    };
    shellAliases = {
      docker-machine-y2m = "docker-machine --storage-path $HOME/.docker/y2m_machine";
      vim = "nvim";
    };
  };

  programs.tmux = {
    enable = true;
    extraConfig = ''
    	# remap prefix from 'C-b' to 'C-e'
	unbind C-b
	set-option -g prefix M-e
	bind-key M-e send-prefix

	# split panes using | and -
	bind b split-window -h
	bind v split-window -v
	unbind '"'
	unbind %

	set -g mouse on

	# reload config file (change file location to your the tmux.conf you want to use)
	bind r source-file /home/sganon/.tmux.conf; display-message "Config reloaded..."

	# Smart pane switching with awareness of Vim splits.
	# See: https://github.com/christoomey/vim-tmux-navigator
	is_vim="ps -o state= -o comm= -t '#{pane_tty}' \
	    | grep -iqE '^[^TXZ ]+ +(\\S+\\/)?g?(view|n?vim?x?)(diff)?$'"
	bind-key -n 'C-h' if-shell "$is_vim" 'send-keys C-h'  'select-pane -L'
	bind-key -n 'C-j' if-shell "$is_vim" 'send-keys C-j'  'select-pane -D'
	bind-key -n 'C-k' if-shell "$is_vim" 'send-keys C-k'  'select-pane -U'
	bind-key -n 'C-l' if-shell "$is_vim" 'send-keys C-l'  'select-pane -R'
	tmux_version='$(tmux -V | sed -En "s/^tmux ([0-9]+(.[0-9]+)?).*/\1/p")'
	if-shell -b '[ "$(echo "$tmux_version < 3.0" | bc)" = 1 ]' \
	    "bind-key -n 'C-\\' if-shell \"$is_vim\" 'send-keys C-\\'  'select-pane -l'"
	if-shell -b '[ "$(echo "$tmux_version >= 3.0" | bc)" = 1 ]' \
	    "bind-key -n 'C-\\' if-shell \"$is_vim\" 'send-keys C-\\\\'  'select-pane -l'"

	bind-key -T copy-mode-vi 'C-h' select-pane -L
	bind-key -T copy-mode-vi 'C-j' select-pane -D
	bind-key -T copy-mode-vi 'C-k' select-pane -U
	bind-key -T copy-mode-vi 'C-l' select-pane -R
	bind-key -T copy-mode-vi 'C-\' select-pane -l

	# switch panes using Alt-hjkl without prefix
	unbind -n M-h
	unbind -n M-l
	unbind -n M-k
	unbind -n M-j

	# switch windows
	bind -n M-C-h select-window -p
	bind -n M-C-l select-window -n

	# Avoid render artefact in vim
	set -g default-terminal "screen-256color"
	set-option -ga terminal-overrides ",xterm-256color:Tc"

	# Spacemacs bug
	set -s escape-time 0

	######################
	### DESIGN CHANGES ###
	######################
	setw -g mode-style 'fg=colour1 bg=colour18 bold'
	# panes
	set -g pane-border-style 'fg=colour220 bg=colour0'
	set -g pane-active-border-style 'bg=colour242 fg=colour232'
	# statusbar
	set -g status-position bottom
	set -g status-justify left
	set -g status-style 'bg=colour236 fg=colour214 dim'

	setw -g window-status-current-style 'fg=colour1 bg=colour235 bold'
	setw -g window-status-current-format ' #I#[fg=colour249]:#[fg=colour255]#W#[fg=colour249]#F '

	setw -g window-status-style 'fg=colour9 bg=colour238'
	setw -g window-status-format ' #I#[fg=colour237]:#[fg=colour250]#W#[fg=colour244]#F '

	set -g status-left-length 20
    '';
  };

}
