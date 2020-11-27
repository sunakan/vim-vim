set encoding=utf-8
scriptencoding utf-8

"-------------------------------------------------------------------------------
" $ mkdir -p ~/.vim/pack/plugins/start
" $ mkdir -p ~/.vim/pack/colors/start
"-------------------------------------------------------------------------------

"-------------------------------------------------------------------------------
" Leaderキーの設定
"-------------------------------------------------------------------------------
function! s:init_leader_key() abort
  let g:mapleader = "\<Space>"
endfunction

"-------------------------------------------------------------------------------
" Color theme
"-------------------------------------------------------------------------------
function! s:setup_color_theme() abort
  let s:color_theme='tokyonight'
  let s:color_theme_dir='~/.vim/pack/colors/start/' . s:color_theme
  if isdirectory(expand(s:color_theme_dir))
    set background=dark
    let g:tokyonight_style='storm'
    let g:tokyonight_transparent_background=1
    exec 'colorscheme ' . s:color_theme
  else
    colorscheme desert
  endif
endfunction

"-------------------------------------------------------------------------------
" インデント系
" shiftwidth: インデントのスペースの数
" smartindent: インデントを考慮して改行
" tabstop: 展開するスペースの個数
" expandtab: タブをスペースに展開(softtab)
"-------------------------------------------------------------------------------
function! s:init_indent_config() abort
  set shiftwidth=2
  set tabstop=2
  set smartindent
  set expandtab
  augroup fileTypeIndent
    au!
    au FileType go setlocal tabstop=4 shiftwidth=4 noexpandtab
    au FileType elm setlocal tabstop=4 shiftwidth=4 noexpandtab
    au FileType Makefile setlocal tabstop=2 shiftwidth=2 noexpandtab
  augroup END
endfunction

"-------------------------------------------------------------------------------
" 補完系
" wildmenu: :ecまで打ってTabキーを押すと補完されるがそれが見やすくなる
"-------------------------------------------------------------------------------
function! s:init_complement_config() abort
  set wildmenu
endfunction

"-------------------------------------------------------------------------------
" 検索系
" incsearch: 文字を入力する度、その時点でパターンマッチしたテキストをハイライト
" hlsearch: 検索結果をハイライト
"-------------------------------------------------------------------------------
function! s:init_search_config() abort
  set incsearch
  set hlsearch
endfunction

"-------------------------------------------------------------------------------
" syntax系
" synmaxcol: 1行が長いファイルをsyntaxを制御して軽くする
"-------------------------------------------------------------------------------
function! s:init_syntax_config() abort
  syntax enable
  set synmaxcol=256
endfunction

"-------------------------------------------------------------------------------
" 新しいウィンドウを開くときの位置
"-------------------------------------------------------------------------------
function! s:init_splitwindow_config() abort
  set splitbelow
  set splitright
endfunction

"-------------------------------------------------------------------------------
" 1行が長すぎないように注意する列をハイライト
"-------------------------------------------------------------------------------
function! s:highlight_warning_column() abort
  let &colorcolumn=join([51,81,91,121],",")
  highlight! ColorColumn guibg=White
endfunction

"-------------------------------------------------------------------------------
" 見た目系
"-------------------------------------------------------------------------------
function! s:init_appearance_config() abort
  set number
  set cursorline
  highlight CursorLine gui=underline cterm=underline
endfunction

"-------------------------------------------------------------------------------
" Shortcut Command
" ESC2回連打で、検索結果のハイライトを除去する
"-------------------------------------------------------------------------------
function! s:shortcut_for_remove_search_result_highlight() abort
  nnoremap <silent> <ESC><ESC> :nohlsearch<CR>
endfunction

"-------------------------------------------------------------------------------
" Shortcut Command
" 段落のショートカット(段落毎に上:{, 段落毎に下:})
"-------------------------------------------------------------------------------
function! s:shortcut_for_jump_paragraph() abort
  nnoremap <C-j> }
  nnoremap <C-k> {
endfunction

"-------------------------------------------------------------------------------
" Shortcut Command
" vimrcを開いたり、読み込んだりするショートカット
"-------------------------------------------------------------------------------
function! s:shortcut_vimrc() abort
  nnoremap <Leader>. :new ~/.vim/vimrc<CR>
  nnoremap <Leader>s :source ~/.vim/vimrc<CR>
endfunction

"-------------------------------------------------------------------------------
" Shortcut Command
" tabpageを作ったり、削除したり移動したり
"-------------------------------------------------------------------------------
function! s:shortcut_tabpage() abort
  set showtabline=2
  nnoremap <Leader>c :tablast <bar> tabnew<CR>
  nnoremap <Leader>x :tabclose<CR>
  nnoremap <C-l> :tabnext<CR>
  nnoremap <C-h> :tabprevious<CR>
endfunction

function! s:shortcut_for_resize_splitwindow() abort
  nnoremap <Leader>j
endfunction

"-------------------------------------------------------------------------------
" Plugin nathanaelkane/vim-indent-guides
"-------------------------------------------------------------------------------
function! s:setup_indent_guides_plugin() abort
  let s:plugin_path='~/.vim/pack/plugins/start/vim-indent-guides'
  if isdirectory(expand(s:plugin_path))
    let g:indent_guides_enable_on_vim_startup = 1
    let g:indent_guides_auto_colors=0
    let g:indent_guides_start_level=1
    let g:indent_guides_guide_size=1
    hi IndentGuidesOdd  ctermbg=239
    hi IndentGuidesEven ctermbg=241
    nnoremap <Leader>o :IndentGuidesToggle<CR>
  endif
endfunction

"-------------------------------------------------------------------------------
" Plugin tchyny/lightline.vim
"-------------------------------------------------------------------------------
function! s:setup_lightline_plugin() abort
  let s:plugin_path='~/.vim/pack/plugins/start/lightline'
  if isdirectory(expand(s:plugin_path))
    set laststatus=2
    "let g:lightline = { 'colorscheme': 'ayu_light' }
    let g:lightline = { 'colorscheme': 'tokyonight' }
  endif
endfunction

"-------------------------------------------------------------------------------
" Plugin lambdalisue/fern.vim
"-------------------------------------------------------------------------------
function! s:setup_fern_plugin() abort
  let s:plugin_path='~/.vim/pack/plugins/start/fern.vim'
  if isdirectory(expand(s:plugin_path))
    nnoremap <Leader>f :Fern . -drawer<CR>
  endif
endfunction

function! s:setup_winresizer_plugin() abort
  let s:plugin_path='~/.vim/pack/plugins/start/winresizer'
  if isdirectory(expand(s:plugin_path))
    let g:winresizer_enable = 1
  endif
endfunction

"-------------------------------------------------------------------------------
" Main
"-------------------------------------------------------------------------------
call s:init_leader_key()
call s:setup_color_theme()
call s:init_syntax_config()
call s:init_indent_config()
call s:init_complement_config()
call s:init_search_config()
call s:init_appearance_config()
call s:init_splitwindow_config()
call s:highlight_warning_column()
call s:shortcut_for_remove_search_result_highlight()
call s:shortcut_for_jump_paragraph()
call s:shortcut_vimrc()
call s:shortcut_tabpage()
call s:shortcut_for_resize_splitwindow()
call s:setup_indent_guides_plugin()
call s:setup_winresizer_plugin()
call s:setup_lightline_plugin()
call s:setup_fern_plugin()
