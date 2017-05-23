" dein settings {{{
if &compatible
  set nocompatible
endif

" dein.vimのディレクトリ
let g:cache_dir = empty($XDG_CACHE_HOME) ? expand('$HOME/.cache') : $XDG_CACHE_HOME
let g:config_dir = empty($XDG_CONFIG_HOME) ? expand('$HOME/.config') : $XDG_CONFIG_HOME
let s:dein_cache_dir = g:cache_dir . '/dein'
let s:dein_config_dir = g:config_dir . '/nvim'
let s:dein_repo_dir = s:dein_cache_dir . '/repos/github.com/Shougo/dein.vim'

" なければgit clone
if !isdirectory(s:dein_repo_dir)
  execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
endif
execute 'set runtimepath^=' . s:dein_repo_dir

if dein#load_state(s:dein_cache_dir)
  call dein#begin(s:dein_cache_dir)

  " 管理するプラグインを記述したファイル
  let s:toml = s:dein_config_dir . '/dein.toml'
  let s:lazy_toml = s:dein_config_dir . '/dein_lazy.toml'
  call dein#load_toml(s:toml, {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})

  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on

" プラグインの追加・削除やtomlファイルの設定を変更した後は
" 適宜 call dein#update や call dein#clear_state を呼んでください。
" そもそもキャッシュしなくて良いならload_state/save_stateを呼ばないようにしてください。

" vimprocだけは最初にインストールしてほしい
if dein#check_install(['vimproc'])
  call dein#install(['vimproc'])
endif
" その他インストールしていないものはこちらに入れる
if dein#check_install()
  call dein#install()
endif
" }}}

set rtp^=$GOPATH/src/github.com/nsf/gocode/vim

syntax on
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,iso-2022-jp,sjis,cp932,euc-jp,cp20932,utf-8
set backupdir=$HOME/.vimbackup

set t_Co=256
colorscheme molokai

""" 表示関係
set wildmode=longest,list
set laststatus=2    " ステータスライン表示
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
autocmd! BufNewFile,BufRead *.xml set tabstop=2 shiftwidth=2 softtabstop=2
autocmd! BufNewFile,BufRead *.html set tabstop=2 shiftwidth=2 softtabstop=2
autocmd! BufNewFile,BufRead *.js set tabstop=2 shiftwidth=2 softtabstop=2
autocmd! BufNewFile,BufRead *.ts set tabstop=2 shiftwidth=2 softtabstop=2
autocmd! BufNewFile,BufRead *.cc set tabstop=2 shiftwidth=2 softtabstop=2
autocmd! BufNewFile,BufRead *.h set tabstop=2 shiftwidth=2 softtabstop=2

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

""" 無効化
" Swapファイル？Backupファイル？前時代的すぎなので全て無効化する
set nowritebackup
set nobackup
set noswapfile

" 前時代的スクリーンベルを無効化
set t_vb=
set novisualbell
