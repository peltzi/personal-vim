execute pathogen#infect()
set autochdir
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
set list
set lcs+=space:·

syntax enable
filetype plugin indent on

colorscheme molokayo
let g:solarized_termcolors=256
let g:rehash256 = 1
let g:airline_theme = 'solarized'
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

let g:pymode_lint_on_fly = 1
let g:pymode_indent = 1
let g:pymode_rope = 0
let g:pymode_folding = 0

let g:ycm_disable_for_files_larger_than_kb = 500
let b:ycm_largefile = 1

let g:NERDTreeShowHidden=1
"let g:NERDTreeQuitOnOpen=1

let g:bufferline_fname_mod = ':t'
let g:bufferline_active_buffer_left = '['
let g:bufferline_active_buffer_right = ']'

" Vim terrraform
let g:terraform_align=1
let g:terraform_fmt_on_save=1

hi Directory guifg=#FF0000 ctermfg=red
highlight OverLength ctermbg=167 ctermfg=white guibg=#592929

match OverLength /\%81v.\+/

"autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p
"autocmd VimEnter * silent! if bufname('%') !~# 'NERD_tree_' | silent NERDTreeFind | wincmd p | endif
map <C-J> :bnext<CR>
map <C-K> :bprev<CR>
map <C-t><up> :tabr<cr>
map <C-t><down> :tabl<cr>
map <C-t><left> :tabp<cr>
map <C-t><right> :tabn<cr>
map <C-d> :NERDTreeToggle<CR>

" Automatically fix PEP8 errors in the current buffer:
noremap <F8> :PymodeLintAuto<CR>:PymodeLint<CR>

noremap <F5> :setlocal spell! spelllang=en_us<CR>

"noremap <F9> :call FoldMethodToggle() <bar>:set foldmethod<CR>

nnoremap <C-N> :bnext<CR>
nnoremap <C-P> :bprev<CR>

behave xterm

" FZF stuff
command! -bang -nargs=* GG
  \ call fzf#vim#grep(
  \   'git grep --line-number '.shellescape(<q-args>, '-e'), 0,
  \   { 'dir': systemlist('git rev-parse --show-toplevel')[0] }, <bang>0)

command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   "rg --hidden --column --line-number --no-heading --color=always --smart-case "
  \   .shellescape(<q-args>), 1, <bang>0)

set nofoldenable
