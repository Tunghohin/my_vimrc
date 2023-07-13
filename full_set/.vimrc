"====================VIMPLUG==================="
call plug#begin()
		
Plug 'itchyny/lightline.vim'

Plug 'junegunn/seoul256.vim'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'jiangmiao/auto-pairs'

Plug 'octol/vim-cpp-enhanced-highlight'

Plug 'rhysd/vim-clang-format'

call plug#end()


"====================SETTING==================="

inoremap ?? <ESC>
nnoremap tp :tabp<CR>
nnoremap tn :tabn<CR>
snoremap ?? <ESC>
nnoremap <c-z> <nop>


set nu
set noexpandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set splitright
"set termwinsize=30x0
"set splitbelow
set cino=N-s
set hidden
set updatetime=300
set signcolumn=yes


"=====================coc.nvim==================="?

let g:coc_global_extensions = [
	\ 'coc-json',
	\ 'coc-tsserver',
	\ 'coc-vimlsp',
	\ 'coc-cmake',
	\ 'coc-highlight',
	\ 'coc-pyright',
	\ 'coc-clangd',
	\ 'coc-explorer',
	\ 'coc-rust-analyzer'
	\]


" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nnoremap se <Cmd>CocDiagnostics<CR>

" Use gb to Jump back 
nnoremap gb <c-o>

" Use K to show documentation in preview window
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Use ctrl+t to open coc-explorer
nnoremap <c-t> <Cmd>CocCommand explorer<CR>

" scroll on floating window
if has('nvim-0.4.0') || has('patch-8.2.0750')
	nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
	nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
	inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
	inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
	vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
	vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif


"====================NERDTREE=================="

"let g:NERDTreeDirArrowExpandable = '▸'
"let g:NERDTreeDirArrowCollapsible = '▾'

" Start NERDTree and leave the cursor in it.
"autocmd VimEnter * NERDTree

" Exit Vim if NERDTree is the only window remaining in the only tab.
"autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
"autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
"    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif

" Open the existing NERDTree on each new tab.
"autocmd BufWinEnter * if getcmdwintype() == '' | silent NERDTreeMirror | endif


"====================THEMESET=================="
colo seoul256

let g:lightline = {
      \ 'colorscheme': 'seoul256',
      \ }
let g:seoul256_srgb = 1
let g:seoul256_background = 233

hi Normal guibg=NONE ctermbg=NONE

"make line number transparent
highlight Normal     ctermbg=NONE guibg=NONE
highlight LineNr     ctermbg=NONE guibg=NONE
highlight SignColumn ctermbg=NONE guibg=NONE
