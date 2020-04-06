colorscheme desert
if filereadable(expand('~/.vim/autoload/plug.vim'))
  call plug#begin('~/.vim/plugged')
    Plug 'fatih/vim-go'
    Plug 'scrooloose/nerdtree'
    Plug 'nathanaelkane/vim-indent-guides'
  call plug#end()
  let g:indent_guides_enable_on_vim_startup = 1
  let g:indent_guides_auto_colors=0
  let g:indent_guides_start_level=1
  let g:indent_guides_guide_size=1
  hi IndentGuidesOdd  ctermbg=237
  hi IndentGuidesEven ctermbg=241
endif

" 自動で行末の空白を削除
autocmd BufWritePre * :%s/\s\+$//ge

" 行末の空白をハイライト
augroup HighlightTrailingSpaces
  autocmd!
  autocmd VimEnter,WinEnter,ColorScheme * highlight TrailingSpaces term=underline guibg=Red ctermbg=1
  autocmd VimEnter,WinEnter * match TrailingSpaces /\s\+$/
augroup END

" インデント関連
set list
set listchars=tab:»-,trail:-
set tabstop=4
set shiftwidth=4
set expandtab
au BufNewFile,BufRead Makefile set noexpandtab tabstop=2 shiftwidth=2

" 行番号とカレント行
set cursorline
hi CursorLine   term=reverse cterm=none ctermbg=240
hi CursorLineNr term=bold    cterm=none ctermfg=228 ctermbg=none
"set number
hi LineNr ctermfg=59

" 121桁目から背景を変える
let &colorcolumn=join([51,81,91]+range(121,999),",")
hi ColorColumn ctermbg=235 guibg=#2c2d27

" 新しいウィンドウを下に開く
set splitbelow
" 新しいウィンドウを右に開く
set splitright
