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
    Plug 'preservim/nerdtree'
    Plug 'Xuyuanp/nerdtree-git-plugin'
call plug#end()

if filereadable(expand("~/.vimrc_background"))
  source ~/.vimrc_background
endif

source ~/.config/nvim/editor_config.vim
source ~/.config/nvim/coc_config.vim
