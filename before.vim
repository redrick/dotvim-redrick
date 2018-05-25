" this file is loaded BEFORE plugins
if filereadable(expand("~/.local-before.vim"))
  echo "~/.local-before.vim is deprecated, please move it to ~/.vimrc.before"
  source ~/.local-before.vim
endif

if filereadable(expand("~/.vimrc.before"))
  source ~/.vimrc.before
endif
