"====================VIMPLUG==================="
call plug#begin()

Plug 'preservim/nerdtree'

Plug 'morhetz/gruvbox'

Plug 'itchyny/lightline.vim'

Plug 'wojciechkepka/vim-github-dark'

Plug 'pboettch/vim-cmake-syntax'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'jiangmiao/auto-pairs'

call plug#end()


"====================SETTING==================="

inoremap ?? <ESC>
nnoremap tp :tabp<CR>
nnoremap tn :tabn<CR>

set nu
set softtabstop=4
set shiftwidth=4
set autoindent


"====================NERDTREE=================="

let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

" Start NERDTree and leave the cursor in it.
autocmd VimEnter * NERDTree

" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif

" Open the existing NERDTree on each new tab.
autocmd BufWinEnter * if getcmdwintype() == '' | silent NERDTreeMirror | endif


"=====================coc.nvim==================="?

inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"


"====================THEMESET=================="

colorscheme ghdark
let g:gh_color = "soft"
let g:lightline = {
      \ 'colorscheme': 'ghdark',
      \ }
