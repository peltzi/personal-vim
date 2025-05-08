call plug#begin('~/.vim/plugged')
Plug 'Raimondi/delimitMate'
Plug 'scrooloose/nerdtree'
Plug 'cespare/vim-toml'
"Plug 'liuchengxu/eleline.vim'
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-fugitive'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'tpope/vim-surround'
Plug 'fatih/vim-go'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'hashivim/vim-terraform'
Plug 'rust-lang/rust.vim'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'fatih/molokai'
Plug 'jvirtanen/vim-hcl'
call plug#end()

" Some very basic vim settings
set laststatus=2
set autochdir
set number
set mouse=a
set history=1000
set incsearch
set autoindent
set expandtab
set shiftwidth=2
set softtabstop=2
set backspace=2
set list
set lcs+=space:·

" Required Neovim to X clipboard integration
set clipboard+=unnamedplus

" Enable syntax highlight
syntax enable

" Get filetype specific indentantion rules
filetype plugin indent on

" Set colorscheme, use termguicolors
set termguicolors
colorscheme molokai

" Colorscheme customizations, try to copy old Mokolayo theme a bit
" hi Normal guibg=#1C1C1C
hi normal guibg=#0f0f0f
"hi Directory guifg=#f92672
hi Directory guifg=#d92164
hi String guifg=#AFAF87
hi Character guifg=#AFAF87
hi Macro guifg=#BADC98
hi Ignore guibg=bg guifg=#303030 ctermbg=bg ctermbg=233
hi Special guibg=bg guifg=#66d0ef ctermbg=bg ctermfg=81 gui=italic cterm=italic
"hi Conceal guifg=#f92672 guibg=bg cterm=bold ctermfg=198 ctermbg=bg
hi Conceal guifg=#d92164 guibg=bg cterm=bold ctermfg=198 ctermbg=bg
hi Search guifg=#000000 guibg=#ffcc00 gui=bold cterm=bold ctermfg=0 ctermbg=220
hi Identifier guifg=#ffb700 ctermfg=214
hi PreProc guibg=bg guifg=#2ee252 ctermbg=bg ctermfg=41
hi PreCondit guibg=bg guifg=#2ee252 ctermbg=bg ctermfg=41
hi Title guibg=bg guifg=#ef7511 ctermbg=bg ctermfg=208
hi ColorColumn guibg=#1e1e1e ctermbg=233
hi Error guibg=#990023 guifg=#ffca00 ctermbg=160 ctermfg=214

" Opt for powerline with Vim-eleline
let g:eleline_powerline_fonts = 1

" Vim terrraform
let g:terraform_align=1
let g:terraform_fmt_on_save=1

" Rustfmt
let g:rustfmt_autosave = 1

" Give over 80 col part of lines a red coloring to signal we are going too far
highlight OverLength ctermbg=167 ctermfg=white guibg=#592929
match OverLength /\%81v.\+/
autocmd FileType rust match OverLength /\%99v.\+/

" Show hidden files in NERDTree
let g:NERDTreeShowHidden=1

" Start NERDTree with Vim
"autocmd VimEnter * NERDTree

" Jump to main window
autocmd VimEnter * wincmd p

" Autoclose Vim if NERDTree is the last window
"autocmd VimEnter * silent! if bufname('%') !~# 'NERD_tree_' | silent NERDTreeFind | wincmd p | endif

" User C-d to toggle NERDTree
map <C-d> :NERDTreeToggle<CR>

" Browse tabs
map <C-t><up> :tabr<cr>
map <C-t><down> :tabl<cr>
map <C-t><left> :tabp<cr>
map <C-t><right> :tabn<cr>

" Browse buffers with ease
nnoremap <C-N> :bnext<CR>
nnoremap <C-P> :bprev<CR>

" FZF stuff
command! -bang -nargs=* GG
  \ call fzf#vim#grep(
  \   'git grep --line-number '.shellescape(<q-args>, '-e'), 0,
  \   { 'dir': systemlist('git rev-parse --show-toplevel')[0] }, <bang>0)

command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   "rg --hidden --column --line-number --no-heading --color=always --smart-case "
  \   .shellescape(<q-args>), 1, <bang>0)

" Exit Neovim terminal with simple keybinding
tnoremap <C-w> <C-\><C-n>

" Force from filetypedetect, for example Makefile.toml case
augroup filetypedetect
    au BufRead,BufNewFile *.toml set filetype=toml
augroup END

""" Below settings required by Coc.nvim

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocActionAsync('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')
"autocmd CursorHold * silent call CocAction('doHover')

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Jump to definition
nmap <silent> gd <Plug>(coc-definition)

" Lightline
function! CocCurrentFunction()
    return get(b:, 'coc_current_function', '')
endfunction

let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'cocstatus', 'currentfunction', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'cocstatus': 'coc#status',
      \   'currentfunction': 'CocCurrentFunction'
      \ },
      \ }
