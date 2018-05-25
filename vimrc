" content of this file is loaded BEFORE all the plugins
if $COLORTERM == 'gnome-terminal'
  set t_Co=256
endif
source ~/.vim/bundles.vim  " vundle plugins list
source ~/.vim/global.vim   " general global configuration
source ~/.vim/plugins.vim  " configuration for plugins that needs to be set BEFORE plugins are loaded
source ~/.vim/macros.vim   " some macros

source ~/.vim/before.vim   " local BEFORE configs

colorscheme railscasts

" after.vim is loaded from ./after/plugin/after.vim
" which should place it AFTER all the other plugins in the loading order
" bindings.vim and local.vim are loaded from after.vim

au BufRead,BufNewFile *.es6 set filetype=javascript

" make test commands execute using dispatch.vim
let test#strategy = "dispatch"

" Remove default ri.vim key mappings
let g:ri_no_mappings=1



set shiftwidth=2
set tabstop=2
