augroup highlight_yank
  autocmd!
  au TextYankPost * silent! lua vim.highlight.on_yank{higroup='IncSearch', timeout=200}
augroup END

let mapleader = "<space>"

# Move to start and back of the line with the same shortcuts as in a terminal
nnoremap <C-e> g_
nnoremap <C-a> ^

# Deleting doesn't copy deleted item
nnoremap x "_x

# Navigating/selecting/copying/deleting forwards/backwards with e/E and q/Q
nnoremap q b
nnoremap E g_
nnoremap Q ^
nnoremap dq db
nnoremap cq cb
nnoremap yq yb
nnoremap vq vb
nnoremap dQ d^
nnoremap cQ c^
nnoremap vQ v^
nnoremap yQ y^
nnoremap cE c$
nnoremap dE d$
nnoremap vE v$

# Navigating to the start of the line using B since ^ is hard to reach
nnoremap B ^

# Navigating 1/2 screen up and down using R and F
nnoremap R <C-u>
nnoremap F <C-d>

# Centering screen when performing a search
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z

# Create an undo checkpoint when writing certain characters
inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap ! !<c-g>u

# Move text up and down using alt + j-k
vnoremap <M-j> :m '>+1<CR>gv=gv
vnoremap <M-k> :m '<-2<CR>gv=gv
