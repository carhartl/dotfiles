syntax on

set backspace=2
set number

" Wrap gitcommit file types at the appropriate length
filetype indent plugin on

" Enter insert mode right away for git commit messages
au FileType gitcommit 1 | startinsert

" Disable modeline as a security precaution
set modelines=0
set nomodeline

" Set up spell check for git commit messages
set spelllang=en_us
autocmd FileType gitcommit setlocal spell
