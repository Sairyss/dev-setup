let mapleader = "<space>"

" Highlights yanked text
augroup highlight_yank
  autocmd!
  au TextYankPost * silent! lua vim.highlight.on_yank{higroup='IncSearch', timeout=200}
augroup END

" Use 's' to enter insert mode ('i' still can be used)
nnoremap s i
" Use 'alt+s' to enter normal mode
inoremap <a-s> <esc>

" Move to start and back of the line with the same shortcuts as in a terminal
nnoremap <C-e> g_
nnoremap <C-a> ^

" Deleting with X doesn't copy deleted character
nnoremap x "_x

" Navigating/selecting/copying/deleting forwards/backwards using e/E and q/Q
nnoremap q b
nnoremap E g_
nnoremap Q ^
nnoremap dq db
nnoremap cq cb
nnoremap yq yb
nnoremap dQ d^
nnoremap cQ c^
nnoremap yQ y^
nnoremap cE c$
nnoremap dE d$
vnoremap Q ^
vnoremap E $
vnoremap q b

" Navigating to the start of the line using B since ^ is hard to reach
nnoremap B ^

" Navigating one paragraph up and down using R and F
nnoremap R {zz
nnoremap F }zz

" Yank everything to the end of the line (excluding newline)
" noremap Y y$

" Select everything between using ctrl+a. Pressing alt+a then ) will select
" everything between parentheses, pressing alt+a and ' will select everything
" betwen single quotes, etc.
nnoremap <a-a> vi
inoremap <a-a> <esc>vi

" Centering screen when performing a search
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z

" Create an undo checkpoint when writing certain characters
inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap ! !<c-g>u
inoremap ; ;<c-g>u

" Move selected text line up and down using alt + j-k
vnoremap <M-j> :m '>+1<CR>gv=gv
vnoremap <M-k> :m '<-2<CR>gv=gv

" In VSCode use insert mode by default when entering buffer 
" (with VSCode Neovim plugin)
if exists('g:vscode')
  autocmd BufEnter * startinsert
endif
