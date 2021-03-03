" Install Plug
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $HOME/.config/nvim/init.vim
endif


call plug#begin('~/.local/share/nvim/site/plugged')
    Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'kyoz/purify', { 'rtp': 'vim' }
    Plug 'chriskempson/base16-vim'
    Plug 'christoomey/vim-tmux-navigator'
    Plug 'itchyny/lightline.vim'
    Plug 'peitalin/vim-jsx-typescript'
    Plug 'mattn/emmet-vim'
    Plug 'NLKNguyen/papercolor-theme'
call plug#end()

set t_Co=256   " This is may or may not needed.

set background=dark
colorscheme PaperColor

"if filereadable(expand("~/.vimrc_background"))
"  source ~/.vimrc_background
"endif

source ~/.config/nvim/editor_config.vim
source ~/.config/nvim/coc_config.vim
