vnoremap < <gv
vnoremap > >gv

set ignorecase
set smartcase
set hlsearch
set incsearch

nnoremap <ESC><ESC> :nohlsearch<CR>

if executable('zenhan')
  autocmd InsertLeave * :call system('zenhan 0')
  autocmd CmdlineLeave * :call system('zenhan 0')
endif