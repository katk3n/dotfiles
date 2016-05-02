"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath^=~/.vim/dein/repos/github.com/Shougo/dein.vim

" Required:
call dein#begin(expand('~/.vim/dein'))

" Let dein manage dein
" Required:
call dein#add('Shougo/dein.vim')

" Add or remove your plugins here:
call dein#add('Shougo/neosnippet.vim')
call dein#add('Shougo/neosnippet-snippets')
call dein#add('Shougo/unite.vim')
call dein#add('houtsnip/vim-emacscommandline')
call dein#add('YankRing.vim')
call dein#add('gtags.vim')
call dein#add('tangledhelix/vim-octopress')
call dein#add('mattn/webapi-vim')
call dein#add('mattn/vimplenote-vim')
call dein#add('tomasr/molokai')
call dein#add('fatih/vim-go')
call dein#add('scrooloose/syntastic')

" You can specify revision/branch/tag.
call dein#add('Shougo/vimshell', { 'rev': '3787e5' })

" Required:
call dein#end()

" Required:
filetype plugin indent on

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------

set rtp^=$GOPATH/src/github.com/nsf/gocode/vim

syntax on
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,iso-2022-jp,sjis,cp932,euc-jp,cp20932,utf-8
set backupdir=$HOME/.vimbackup

set t_Co=256
colorscheme molokai


""" コピペ関係
" クリップボードをデフォルトのレジスタとして指定。後にYankRingを使うので
" 'unnamedplus'が存在しているかどうかで設定を分ける必要がある
if has('unnamedplus')
    set clipboard& clipboard+=unnamedplus
else
    set clipboard& clipboard+=unnamed
endif
"set clipboard=unnamed,autoselect


""" 表示関係
set wildmode=longest,list
set laststatus=2    " ステータスライン表示
set rtp+=~/.vim/neobundle/powerline/powerline/bindings/vim
set textwidth=0     " 自動的に改行が入るのを無効化

""" インデント
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set smartindent
inoremap # X#
" ビジュアルモードでインデント変更後も選択を継続
vnoremap < <gv
vnoremap > >gv


""" filetype
" php
autocmd! BufNewFile,BufRead *.inc set filetype=php
" Octopress
autocmd! BufNewFile,BufRead *.markdown set filetype=octopress
" NmapScriptEngine
autocmd! BufNewFile,BufRead *.nse set filetype=lua
" go
" gofmt の代わりに goimports を使う
let g:gofmt_command = 'goimports'
autocmd! BufNewFile,BufRead *.go set filetype=go noexpandtab
" xml
autocmd! BufNewFile,BufRead *.xml set tabstop=2 shiftwidth=2 softtabstop=2


""" 検索
set ignorecase  " 大文字小文字を区別しない
set smartcase   " 検索文字に大文字がある場合は区別する
set hlsearch    " 検索結果をハイライト
set incsearch   " インクリメンタルサーチ
" ESC 2回で検索ハイライト解除
nnoremap <ESC><ESC> :nohlsearch<CR>

""" 行末の空白をハイライト
highlight WhitespaceEOL ctermbg=white guibg=white
match WhitespaceEOL /\s\+$/

""" タブ移動
nnoremap <silent> <tab> :tabn<CR>
nnoremap <silent> <S-tab> :tabp<CR>

" w!! でスーパーユーザーとして保存（sudoが使える環境限定）
cmap w!! w !sudo tee > /dev/null %

""" ステータスライン
set statusline=%{expand('%:p:t')}\ %<[%{expand('%:p:h')}]%=\ %m%r%y%w[%{&fenc!=''?&fenc:&enc}][%{&ff}][%3l,%3c,%3p%%]
highlight StatusLine guifg=Black guibg=Green ctermfg=Black ctermbg=Darkcyan cterm=none
highlight StatusLineNC guifg=Black guibg=Gray ctermfg=Black ctermbg=Gray cterm=none

" 挿入モード時の色指定
" https://github.com/fuenor/vim-statusline/blob/master/insert-statusline.vim
if !exists('g:hi_insert')
  let g:hi_insert = 'highlight StatusLine guifg=White guibg=Green gui=none ctermfg=Black ctermbg=Green cterm=none'
endif

if has('unix') && !has('gui_running')
  inoremap <silent> <ESC> <ESC>
  inoremap <silent> <C-[> <ESC>
endif

if has('syntax')
  augroup InsertHook
    autocmd!
    autocmd InsertEnter * call s:StatusLine('Enter')
    autocmd InsertLeave * call s:StatusLine('Leave')
  augroup END
endif

let s:slhlcmd = ''
function! s:StatusLine(mode)
  if a:mode == 'Enter'
    silent! let s:slhlcmd = 'highlight ' . s:GetHighlight('StatusLine')
    silent exec g:hi_insert
  else
    highlight clear StatusLine
    silent exec s:slhlcmd
  endif
endfunction

function! s:GetHighlight(hi)
  redir => hl
  exec 'highlight '.a:hi
  redir END
  let hl = substitute(hl, '[\r\n]', '', 'g')
  let hl = substitute(hl, 'xxx', '', '')
  return hl
endfunction


"" gtags
"nmap <C-q> <C-w><C-w><C-w>q
"nmap <C-g> :Gtags -g
"nmap <C-l> :Gtags -f %<CR>
nmap <C-j> :Gtags <C-r><C-w><CR>
"nmap <C-k> :Gtags -r <C-r><C-w><CR>
"nmap <C-n> :cn<CR>
"nmap <C-p> :cp<CR>

""" Unite.vim
" 起動時にインサートモードで開始
let g:unite_enable_start_insert = 1

" バッファ一覧
nnoremap <silent> ;b :<C-u>Unite buffer<CR>
" ファイル一覧
nnoremap <silent> ;f :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
" レジスタ一覧
nnoremap <silent> ;r :<C-u>Unite -buffer-name=register register<CR>
" 最近使用したファイル一覧
nnoremap <silent> ;h :<C-u>Unite file_mru<CR>
" 全部乗せ
nnoremap <silent> ;a :<C-u>UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file<CR>

" unite.vim上でのキーマッピング
autocmd FileType unite call s:unite_my_settings()
function! s:unite_my_settings()
    " 単語単位からパス単位で削除するように変更
    imap <buffer> <C-w> <Plug>(unite_delete_backward_path)
    " ESCキーを2回押すと終了する
    nmap <silent><buffer> <ESC><ESC> q
    imap <silent><buffer> <ESC><ESC> <ESC>q
endfunction

""" syntastic
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=2

""" 無効化
" Swapファイル？Backupファイル？前時代的すぎなので全て無効化する
set nowritebackup
set nobackup
set noswapfile

" 前時代的スクリーンベルを無効化
set t_vb=
set novisualbell

" Eclim
"nnoremap <silent> <buffer> <leader>i :JavaImport<cr>
"nnoremap <silent> <buffer> <leader>d :JavaDocSearch -x declarations<cr>
"nnoremap <silent> <buffer> <cr> :JavaSearchContext<cr>
