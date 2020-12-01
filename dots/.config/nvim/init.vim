set cursorcolumn
set encoding=UTF-8
set ts=2
set sw=2
set nu
set relativenumber
set tabstop=4
set cursorline
so ~/.config/nvim/coc.vim
so ~/.config/nvim/themes/airline.vim
" Change <leader> key to space
let mapleader = ","
" Change <localleader> key to backslash i.e. \
let maplocalleader = ','
let g:OmniSharp_server_stdio = 1
let g:rainbow_active = 1 "set to 0 if you want to enable it later via :RainbowToggle
 
"AutoCmd C#
au CursorHold *.cs :OmniSharpHighlightTypes 
let g:ale_linters = { 'cs': ['OmniSharp'] }
autocmd CursorHold *.cs OmniSharpTypeLookup

" these "Ctrl mappings" work well when Caps Lock is mapped to Ctrl
nmap <silent> t<C-n> :TestNearest<CR>
nmap <silent> t<C-f> :TestFile<CR>
nmap <silent> t<C-s> :TestSuite<CR>
nmap <silent> t<C-l> :TestLast<CR>
nmap <silent> t<C-g> :TestVisit<CR>

"coc prettier 
command! -nargs=0 Prettier :CocCommand prettier.formatFile
vmap <leader>f  <Plug>(coc-format-selected)

" make test commands execute using dispatch.vim
let test#strategy = "dispatch"


let test#strategy = {
  \ 'nearest': 'neovim',
  \ 'file':    'dispatch',
  \ 'suite':   'basic',
\}

" Copy to clipboard
nnoremap <C-c> "+y

" Copy to clipboard
vnoremap <C-c> "+y


"viminspector
let g:vimspector_enable_mappings = 'VISUAL_STUDIO'
sign define vimspectorBP text=🔴 texthl=Normal
sign define vimspectorBPDisabled text=🔵 texthl=Normal
sign define vimspectorPC text=🔶 texthl=SpellBad
"OmniSharp 
nmap <C-f><C-f><C-h> :OmniSharpHighlightTypes<CR>
nmap <C-f><C-f><C-G> :OmniSharpFindImplementations<CR>
nmap <C-f><C-f><C-t> :OmniSharpCodeFormat<CR>
nmap <C-f><C-f><C-a> :OmniSharpGetCodeActions<CR>
nmap <C-f><C-f><C-u> :OmniSharpRunTest<CR>

"custom mapping
nmap <leader><leader>f :Files<CR> 
set expandtab
" In ~/.vim/ftplugin/javascript.vim, or somewhere similar.

" NerdTree Toggle
nnoremap <silent> <C-n> :NERDTreeToggle<CR>
noremap <leader>pv :NERDTreeFind<CR>
" Easy motion
nmap <silent> <leader><leader>w <Plug>(easymotion-bd-w)
nmap <silent> <leader><leader>e <Plug>(easymotion-bd-e)

"ALE
"nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
"you completeme
au FileType c,cpp nnoremap <buffer> <c-]> :YcmCompleter GoTo<CR>


" For Neovim 0.1.3 and 0.1.4
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" Or if you have Neovim >= 0.1.5
if (has("termguicolors"))
 set termguicolors
endif


" Fix files with prettier, and then ESLint.
" Equivalent to the above.
let g:ale_completion_enabled = 1

" In ~/.vim/vimrc, or somewhere similar.
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'c#': ['prettier'],
\}
call plug#begin('~/.local/share/nvim/plugged')

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'sbdchd/neoformat'
Plug 'ekalinin/Dockerfile.vim'
Plug 'mhartington/oceanic-next'
Plug 'severin-lemaignan/vim-minimap'
Plug 'neomake/neomake'
Plug 'tpope/vim-commentary'
Plug 'ryanoasis/vim-devicons'
Plug 'OmniSharp/omnisharp-vim'
Plug 'mhinz/vim-startify'
Plug 'andymass/vim-matchup'
Plug 'airblade/vim-gitgutter'
Plug 'vim-vdebug/vdebug'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight', { 'on':
              \ ['NERDTreeToggle', 'NERDTreeFind'] }
Plug 'dense-analysis/ale'
"Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'luochen1990/rainbow'
Plug 'skanehira/preview-markdown.vim'
Plug 'tpope/vim-surround'
Plug 'puremourning/vimspector'
Plug 'easymotion/vim-easymotion'
Plug 'bling/vim-airline'
Plug 'scrooloose/nerdtree'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'janko/vim-test'
Plug 'preservim/nerdcommenter'
Plug 'pangloss/vim-javascript'
Plug 'heavenshell/vim-jsdoc',{'for':'javascript','tag':'1.0.0'}
Plug 'pangloss/vim-javascript'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'thaerkh/vim-workspace'
" React code snippets
Plug 'epilande/vim-react-snippets'
Plug 'alvan/vim-closetag'
Plug 'vim-airline/vim-airline-themes'

call plug#end()
"
"  neomake
" When writing a buffer (no delay).
call neomake#configure#automake('w')
" When writing a buffer (no delay), and on normal mode changes (after 750ms).
call neomake#configure#automake('nw', 750)
" When reading a buffer (after 1s), and when writing (no delay).
call neomake#configure#automake('rw', 1000)
" Full config: when writing or reading a buffer, and on changes in insert and
" normal mode (after 500ms; no delay when writing).
call neomake#configure#automake('nrwi', 500)

"tagclose auto 
" filenames like *.xml, *.html, *.xhtml, ...
" These are the file extensions where this plugin is enabled.
"
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.jsx,*.js'

" filenames like *.xml, *.xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'

" filetypes like xml, html, xhtml, ...
" These are the file types where this plugin is enabled.
"
let g:closetag_filetypes = 'html,xhtml,phtml'

" filetypes like xml, xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filetypes = 'xhtml,jsx'

" integer value [0|1]
" This will make the list of non-closing tags case-sensitive (e.g. `<Link>` will be closed while `<link>` won't.)
"
let g:closetag_emptyTags_caseSensitive = 1

" dict
" Disables auto-close if not in a "valid" region (based on filetype)
"
let g:closetag_regions = {
    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
    \ 'javascript.jsx': 'jsxRegion',
    \ }

" Shortcut for closing tags, default is '>'
"
let g:closetag_shortcut = '>'

" Add > at current position without closing the current tag, default is ''
"
let g:closetag_close_shortcut = '<leader>>'

"nerdtree config
"

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"guttergit 
"
"

let g:gitgutter_sign_added = '✚'
let g:gitgutter_sign_modified = '✹'
let g:gitgutter_sign_removed = '-'
let g:gitgutter_sign_removed_first_line = '-'
let g:gitgutter_sign_modified_removed = '-'

" Theme
syntax enable
colorscheme OceanicNext

let g:molokai_original = 1

set updatetime=200

sign define OmniSharpCodeActions text=🔥

augroup OSCountCodeActions
  autocmd!
  autocmd FileType cs set signcolumn=yes
  autocmd CursorHold *.cs call OSCountCodeActions() 
augroup END



function! OSCountCodeActions() abort
  if bufname('%') ==# '' || OmniSharp#FugitiveCheck() | return | endif
  if !OmniSharp#IsServerRunning() | return | endif
  let opts = {
  \ 'CallbackCount': function('s:CBReturnCount'),
  \ 'CallbackCleanup': {-> execute('sign unplace 99')}
  \}
  call OmniSharp#CountCodeActions(opts)
endfunction

function! s:CBReturnCount(count) abort
  if a:count
    let l = getpos('.')[1]
    let f = expand('%:p')
    execute ':sign place 99 line='.l.' name=OmniSharpCodeActions file='.f
  endif
endfunction

" open new split panes to right and below
set splitright
set splitbelow
" turn terminal to normal mode with escape
tnoremap <Esc> <C-\><C-n>
" start terminal in insert mode
au BufEnter * if &buftype == 'terminal' | :startinsert | endif
" open terminal on ctrl+n
function! OpenTerminal()
  split term://bash
  resize 10
endfunction
nnoremap <c-t> :call OpenTerminal()<CR>
