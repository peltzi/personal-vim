execute pathogen#infect()
set number
set mouse=a
set history=1000
set incsearch
set autoindent
set pastetoggle=<F2>
set expandtab
set shiftwidth=2
set softtabstop=2
set backspace=2
set background=dark

set nofoldenable

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

syntax enable
filetype plugin indent on

colorscheme molokayo
let g:solarized_termcolors=256
let g:rehash256 = 1
let g:airline_theme = 'solarized'
let g:airline#extensions#tabline#enabled = 1

let g:pymode_lint_on_fly = 1
let g:pymode_indent = 1
let g:pymode_rope = 0

let g:ycm_disable_for_files_larger_than_kb = 500
let b:ycm_largefile = 1

if has("gui_running")
  if has("gui_gtk2")
    set lines=40 columns=160

    set clipboard+=unnamed  " use the clipboards of vim and win
    set paste               " Paste from a windows or from vim
    set go+=a               " Visual selection automatically copied to the clipboard

    " copy and paste
    vmap <C-c> "+yi
    vmap <C-x> "+c
    vmap <C-v> c<ESC>"+p
    imap <C-v> <ESC>"+pa

  endif
endif

hi Directory guifg=#FF0000 ctermfg=red
highlight OverLength ctermbg=167 ctermfg=white guibg=#592929

match OverLength /\%81v.\+/

autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p
autocmd VimEnter * silent! if bufname('%') !~# 'NERD_tree_' | silent NERDTreeFind | wincmd p | endif
map <C-J> :bnext<CR>
map <C-K> :bprev<CR>
map <C-t><up> :tabr<cr>
map <C-t><down> :tabl<cr>
map <C-t><left> :tabp<cr>
map <C-t><right> :tabn<cr>

" Automatically fix PEP8 errors in the current buffer:
noremap <F8> :PymodeLintAuto<CR>:PymodeLint<CR>

noremap <F5> :setlocal spell! spelllang=en_us<CR>

function! FoldMethodToggle()
  if !exists('b:old_foldmethod')
    let b:old_foldmethod=&foldmethod
    setlocal foldmethod=manual
  else
    execute "setlocal foldmethod=".b:old_foldmethod
    unlet b:old_foldmethod
  endif
endfunction

noremap <F9> :call FoldMethodToggle() <bar>:set foldmethod<CR>

behave xterm
