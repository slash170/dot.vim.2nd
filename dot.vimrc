" vim: foldmethod=marker
"---------------------------------------------------------------------------
" .vimrc
"---------------------------------------------------------------------------
" Initialize:"{{{
"
augroup ReloadVimrc
    autocmd!
augroup END

""  base settings
set number
set relativenumber
set history=5000
set showmatch
set smartindent
set shiftwidth=4
set tabstop=4
set expandtab
set title
set laststatus=2
set hlsearch incsearch
set ignorecase
set smartcase
set backspace=indent,eol,start
set cursorline
set cursorcolumn
set splitbelow
set noswapfile
set wildmenu
set wildmode=full
set virtualedit=block
set mouse=a
set ttymouse=xterm2

if &compatible
  set nocompatible
endif
filetype plugin indent on
syntax enable

"" color settings
" https://vim-jp.org/vimdoc-ja/syntax.html#cterm-colors
"                                              cterm-colors
" NR-16   NR-8    COLOR NAME
" 0       0       Black
" 1       4       DarkBlue
" 2       2       DarkGreen
" 3       6       DarkCyan
" 4       1       DarkRed
" 5       5       DarkMagenta
" 6       3       Brown, DarkYellow
" 7       7       LightGray, LightGrey, Gray, Grey
" 8       0*      DarkGray, DarkGrey
" 9       4*      Blue, LightBlue
" 10      2*      Green, LightGreen
" 11      6*      Cyan, LightCyan
" 12      1*      Red, LightRed
" 13      5*      Magenta, LightMagenta
" 14      3*      Yellow, LightYellow
" 15      7*      White

" colorscheme molokai
colorscheme iceberg
set background=dark
highlight search cterm=NONE ctermfg=Black ctermbg=DarkCyan

" cursor move for command-line-mode
cnoremap <C-a> <Home>
" cursor move for normal-mode
nnoremap <C-j> }
nnoremap <C-k> {

" shortcut command for word replace
nnoremap <C-R><C-E> :%s;<C-R><C-W>;gc<Left><Left><Left>;
" don't move the cursor when used '*' command
noremap  * *N

" paste mode toggle
set pastetoggle=<F2>

" set leader key bind
let g:mapleader = "\<Space>"

" set clipboard
set clipboard^=unnamed,unnamedplus

" Turn off paste mode when leaving insert
autocmd ReloadVimrc InsertLeave * set nopaste

nnoremap <silent> <Leader>ev :<C-u>edit $MYVIMRC<CR>
nnoremap <silent> <Leader>eg :<C-u>edit $MYGVIMRC<CR>
nnoremap <silent> <Leader>tv :<C-u>tabedit $MYVIMRC<CR>
nnoremap <silent> <Leader>tg :<C-u>tabedit $MYGVIMRC<CR>
nnoremap <silent> <Leader>rv :<C-u>source $MYVIMRC \| if has('gui_running') \| source $MYGVIMRC \| endif <CR>
nnoremap <silent> <Leader>rg :<C-u>source $MYGVIMRC<CR>
"}}}

"---------------------------------------------------------------------------
" Plugin Loading:"{{{
"
call jetpack#begin()
call jetpack#add('Shougo/neosnippet.vim')
call jetpack#add('Shougo/neosnippet-snippets')
call jetpack#add('lambdalisue/fern.vim')
call jetpack#add('lambdalisue/fern-git-status.vim')
call jetpack#add('lambdalisue/nerdfont.vim')
call jetpack#add('lambdalisue/fern-renderer-nerdfont.vim')
call jetpack#add('lambdalisue/glyph-palette.vim')
call jetpack#add('lambdalisue/gina.vim')
call jetpack#add('tpope/vim-surround')
call jetpack#add('skanehira/preview-markdown.vim')
call jetpack#add('previm/previm')
call jetpack#add('tyru/open-browser.vim')
call jetpack#add('itchyny/lightline.vim')
call jetpack#add('fatih/vim-go')
call jetpack#add('nathanaelkane/vim-indent-guides')
call jetpack#add('tyru/caw.vim')
call jetpack#add('tomasr/molokai')
call jetpack#add('cocopon/iceberg.vim')
call jetpack#add('thinca/vim-quickrun')
call jetpack#add('dhruvasagar/vim-table-mode')
call jetpack#add('simeji/winresizer')
call jetpack#add('cohama/lexima.vim')
call jetpack#add('easymotion/vim-easymotion')
call jetpack#add('RRethy/vim-illuminate')
call jetpack#add('csexton/trailertrash.vim')
call jetpack#add('junegunn/vim-peekaboo')
call jetpack#add('junegunn/fzf', { 'build': './install --all', 'merged': 0 })
call jetpack#add('junegunn/fzf.vim', { 'depends': 'fzf' })
call jetpack#add('tpope/vim-fugitive')
call jetpack#add('prabirshrestha/async.vim')
call jetpack#add('prabirshrestha/vim-lsp')
call jetpack#add('prabirshrestha/asyncomplete.vim')
call jetpack#add('prabirshrestha/asyncomplete-lsp.vim')
call jetpack#add('prabirshrestha/asyncomplete-neosnippet.vim')
call jetpack#add('mattn/vim-lsp-settings', {'merged': 0})
call jetpack#add('evanleck/vim-svelte')
call jetpack#end()

"}}}

"---------------------------------------------------------------------------
" Fern:"{{{
"
noremap <C-e> :<C-u>Fern . -drawer -toggle -keep -reveal=%<CR>
inoremap <C-e> <ESC>:<C-u>Fern . -drawer -toggle -keep -reveal=%<CR>

let g:fern#renderer = "nerdfont"
"}}}

"---------------------------------------------------------------------------
" Glyph-Palette:"{{{
"
augroup my-glyph-palette
  autocmd! *
  autocmd FileType fern call glyph_palette#apply()
  autocmd FileType nerdtree,startify call glyph_palette#apply()
augroup END
"}}}

"---------------------------------------------------------------------------
" Gina:"{{{
"
" alias setting
call gina#custom#command#alias('status', 'st')
call gina#custom#command#alias('patch',  'pp')
call gina#custom#command#alias('commit', 'ci')

" option setting
call gina#custom#command#option('commit','-v|--verbose')
call gina#custom#command#option('ci',    '-v|--verbose')
call gina#custom#command#option('log',   '--opener', 'vsplit')
"}}}

"---------------------------------------------------------------------------
" For Conceal:"{{{
"
if has('conceal')
    set conceallevel=2 concealcursor=niv
    autocmd ReloadVimrc FileType json setl conceallevel=0
    autocmd ReloadVimrc FileType markdown setl conceallevel=0
endif
"}}}

"---------------------------------------------------------------------------
" LightLine:"{{{
"
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ]],
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '', 'right': '' }
      \ }

if !has('gui_running')
    set t_Co=256
endif
"}}}

"---------------------------------------------------------------------------
" VimGO:"{{{
"
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_fmt_command = "goimports"

let g:go_def_mapping_enabled = 0  " for Language Server config
"}}}

"---------------------------------------------------------------------------
" CAW:"{{{
"
nmap <Leader>c <Plug>(caw:hatpos:toggle)
vmap <Leader>c <Plug>(caw:hatpos:toggle)
"}}}

"---------------------------------------------------------------------------
" Markdown Preview:"{{{
"
let g:preview_markdown_vertical = 1
"}}}

"---------------------------------------------------------------------------
" VimIndentGuides:"{{{
"
let g:indent_guides_auto_colors=0
autocmd ReloadVimrc VimEnter,Colorscheme * :hi IndentGuidesOdd   ctermbg=237
autocmd ReloadVimrc VimEnter,Colorscheme * :hi IndentGuidesEven  ctermbg=235

let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_guide_size=1
"}}}

"---------------------------------------------------------------------------
" QuickRun:"{{{
"
let g:quickrun_config={
    \ '*': {'outputter/buffer/split': '10',
    \       'hook/time/enable': '1'}
    \ }
"}}}

"---------------------------------------------------------------------------
" TableMode:"{{{
"
let g:table_mode_corner_corner="+"
let g:table_mode_header_fillchar="="
"}}}

"---------------------------------------------------------------------------
" GNU GLOBAL:"{{{
"
nnoremap <Leader><C-f> :<C-u>Gtags -f %<CR>
nnoremap <Leader><C-j> :<C-u>GtagsCursor<CR>
" nnoremap <C-n>       :<C-u>cn<CR>
" nnoremap <C-m>       :<C-u>cp<CR> " can't use this key-map
"}}}

"---------------------------------------------------------------------------
" WIN Resizer:"{{{
"
let g:winresizer_start_key = '<Leader><C-E>'
"}}}

"---------------------------------------------------------------------------
" EasyMotion:"{{{
"
let g:EasyMotion_do_mapping = 0 " Disable default mappings

" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
" nmap s <Plug>(easymotion-overwin-f)
" or
" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
nmap s <Plug>(easymotion-overwin-f2)

" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1

" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
"}}}

"---------------------------------------------------------------------------
" Illuminate:"{{{
"
let g:Illuminate_delay = 250
highlight illuminatedWord cterm=NONE ctermfg=Black ctermbg=DarkCyan
"}}}

"---------------------------------------------------------------------------
" TrailerTrash:"{{{
"
hi UnwantedTrailerTrash guibg=DarkMagenta ctermbg=DarkMagenta
"}}}

"---------------------------------------------------------------------------
" Fzf:"{{{
"
" let g:fzf_command_prefix = 'Fzf'
noremap <Leader><C-p>      :<C-u>Buffers<CR>
noremap <Leader><C-l>      :<C-u>Files<CR>
noremap <Leader><C-s>      :<C-u>Ghq<CR>
noremap <Leader><C-g><C-l> :<C-u>GFiles<CR>
noremap <Leader><C-g><C-c> :<C-u>Commits<CR>
noremap <Leader><C-a>      :<C-u>History<CR>

let g:fzf_layout = { 'window': { 'width': 0.95, 'height': 0.95 }}

" - Command for git grep:{{{
" fzf#vim#grep(command, with_column, [options], [fullscreen])
command! -bang -nargs=* GGrep
  \ call fzf#vim#grep(
  \   'git grep --line-number -- '.shellescape(<q-args>), 0,
  \   fzf#vim#with_preview({'dir': systemlist('git rev-parse --show-toplevel')[0]}), <bang>0)
"}}}

" - Command for Ag:{{{
" Augmenting Ag command using fzf#vim#with_preview function
"   * fzf#vim#with_preview([[options], [preview window], [toggle keys...]])
"     * For syntax-highlighting, Ruby and any of the following tools are required:
"       - Bat: https://github.com/sharkdp/bat
"       - Highlight: http://www.andre-simon.de/doku/highlight/en/highlight.php
"       - CodeRay: http://coderay.rubychan.de/
"       - Rouge: https://github.com/jneen/rouge
"
"   :Ag  - Start fzf with hidden preview window that can be enabled with "?" key
"   :Ag! - Start fzf in fullscreen and display the preview window above
command! -bang -nargs=* Ag
  \ call fzf#vim#ag(<q-args>,
  \                 <bang>0 ? fzf#vim#with_preview('up:60%')
  \                         : fzf#vim#with_preview('right:50%:hidden', '?'),
  \                 <bang>0)
"}}}

" - Command for Rg:{{{
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case -- '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview(), <bang>0)
"}}}

" - Likewise, Files command with preview window:{{{
command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)
"}}}

" - Command for ghq:{{{
command! -nargs=0 Ghq
  \ call fzf#run({
  \              'source': 'ghq list --full-path',
  \              'sink': 'cd'
  \              })
"}}}
"}}}

"---------------------------------------------------------------------------
" Language Server:{{{
"
" for debug work config
" let g:lsp_log_verbose = 1
" let g:lsp_log_file = expand('~/vim-lsp.log')
" let g:asyncomplete_log_file = expand('~/asyncomplete.log')

" for asyncomplete config
" let g:asyncomplete_auto_popup = 0
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" inoremap <expr> <CR>    pumvisible() ? "\<C-y>" : "\<CR>"

call asyncomplete#register_source(asyncomplete#sources#neosnippet#get_source_options({
    \ 'name': 'neosnippet',
    \ 'whitelist': ['*'],
    \ 'completor': function('asyncomplete#sources#neosnippet#completor'),
    \ }))

imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" for vim-lsp config
let g:lsp_diagnostics_enabled = 1
let g:lsp_diagnostics_echo_cursor = 1

let g:lsp_settings = {}
let g:lsp_settings['gopls'] = {
  \  'workspace_config': {
  \    'analyses': {
  \      'fillstruct': v:true,
  \    },
  \  },
  \  'initialization_options': {
  \    'analyses': {
  \      'fillstruct': v:true,
  \    },
  \  },
  \}

function! s:on_lsp_buffer_enabled() abort
  setlocal omnifunc=lsp#complete
  nmap <buffer> gd  <plug>(lsp-definition)
  nmap <buffer> gpd <plug>(lsp-peek-definition)
  nmap <buffer> gh  <plug>(lsp-hover)
  nmap <buffer> gr  <plug>(lsp-rename)
  nmap <buffer> gca <plug>(lsp-code-action)
  nmap <buffer> gdd <plug>(lsp-document-diagnostics)
endfunction

augroup lsp_install
  au!
  autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END
"}}}
