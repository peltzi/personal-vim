execute pathogen#infect()
set number
set mouse=a
set history=1000
set incsearch
set autoindent
set shiftwidth=2
set expandtab
syntax enable
set background=dark
let g:solarized_termcolors=256


if &term =~ "xterm"
  " 256 colors
  let &t_Co = 256
  " restore screen after quitting
  let &t_ti = "\<Esc>7\<Esc>[r\<Esc>[?47h"
  let &t_te = "\<Esc>[?47l\<Esc>8"
  if has("terminfo")
    let &t_Sf = "\<Esc>[3%p1%dm"
    let &t_Sb = "\<Esc>[4%p1%dm"
  else
    let &t_Sf = "\<Esc>[3%dm"
    let &t_Sb = "\<Esc>[4%dm"
  endif
endif

let g:rehash256 = 1
colorscheme molokai 
let g:airline_theme = 'solarized'
hi Directory guifg=#FF0000 ctermfg=red
autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p
let g:airline#extensions#tabline#enabled = 1
map <C-J> :bnext<CR>
map <C-K> :bprev<CR>
behave xterm
set expandtab
set shiftwidth=2
set softtabstop=2
set backspace=2
