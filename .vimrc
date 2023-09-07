syntax on

set backspace=2
set number

" Disable modeline as a security precaution
set modelines=0
set nomodeline

" Wrap gitcommit file types at the appropriate length
filetype indent plugin on

" Enter insert mode right away for git commit messages
autocmd FileType gitcommit 1 | startinsert

" Set up spell check for git commit messages
set spelllang=en_us
autocmd FileType gitcommit setlocal spell
