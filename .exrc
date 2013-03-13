set ts=2 sw=2
syntax enable
set background=dark
set nohlsearch
set incsearch

if has("autocmd")
  " Drupal *.module files.
  augroup module
    autocmd BufRead *.module set filetype=php
  augroup END

endif
