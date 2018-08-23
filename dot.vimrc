""  base settings
set number
set showmatch
set autoindent
set shiftwidth=4
set tabstop=4
set expandtab
set title
set laststatus=2
set hlsearch incsearch
set backspace=indent,eol,start
set cursorline
set cursorcolumn

syntax on
colorscheme molokai
highlight search cterm=NONE ctermfg=grey ctermbg=blue

" esc key bind
imap <c-j> <esc>
vmap <c-j> <esc>
smap <c-j> <esc>

" paste mode toggle
set pastetoggle=<F2>
" Turn off paste mode when leaving insert
autocmd InsertLeave * set nopaste

" set leader key bind
let mapleader = "\<Space>"

if has('mac')
    set clipboard+=unnamed
endif


"dein Scripts-----------------------------
if &compatible
    set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=$HOME/.vim/repos/github.com/Shougo/dein.vim
call dein#begin($HOME . '/.vim/')

" Let dein manage dein
" Required:
call dein#add('Shougo/dein.vim')

" Add or remove your plugins here:
call dein#add('Shougo/neosnippet.vim')
call dein#add('Shougo/neosnippet-snippets')
call dein#add('Shougo/deoplete.nvim')
call dein#add('zchee/deoplete-go', {'build': 'make'})
call dein#add('zchee/deoplete-jedi')
call dein#add('davidhalter/jedi')
call dein#add('roxma/nvim-yarp')
call dein#add('roxma/vim-hug-neovim-rpc')
call dein#add('Shougo/unite.vim')
call dein#add('Shougo/denite.nvim')
call dein#add('Shougo/unite-outline')
call dein#add('Shougo/neomru.vim')
call dein#add('Shougo/vimfiler.vim')
call dein#add('Shougo/vimshell.vim')
call dein#add('Shougo/vimproc.vim')
call dein#add('itchyny/lightline.vim')
call dein#add('fatih/vim-go')
call dein#add('vim-syntastic/syntastic')
call dein#add('nathanaelkane/vim-indent-guides')
call dein#add('tyru/caw.vim')
call dein#add('tomasr/molokai')
call dein#add('thinca/vim-quickrun')
call dein#add('dhruvasagar/vim-table-mode')
call dein#add('simeji/winresizer')
call dein#add('cohama/lexima.vim')
call dein#add('easymotion/vim-easymotion')

" Required:
call dein#end()

" Required:
filetype plugin indent on

" If you want to install not installed plugins on startup.
if dein#check_install()
    call dein#install()
endif

"End dein Scripts-------------------------


"" vim-filer settings
noremap <C-e> :<C-u>VimFilerExplorer<CR>
inoremap <C-e> <ESC>:<C-u>VimFilerExplorer<CR>


"" denite settings
" Change mappings.
call denite#custom#map(
      \ 'insert',
      \ '<C-j>',
      \ '<denite:move_to_next_line>',
      \ 'noremap'
      \)
call denite#custom#map(
      \ 'insert',
      \ '<C-k>',
      \ '<denite:move_to_previous_line>',
      \ 'noremap'
      \)

" Ag command on grep source
call denite#custom#var('grep', 'command', ['ag'])
call denite#custom#var('grep', 'default_opts',
		\ ['-i', '--nocolor', '--nogroup'])
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', [])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'final_opts', [])

" バッファ一覧
noremap <C-p> :<C-u>Denite buffer<CR>
" 最近使ったファイルの一覧
noremap <Leader><C-a> :<C-u>Denite file_mru<CR>
" カレントディレクトリ配下のファイルの一覧
noremap <Leader><C-l> :<C-u>Denite file_rec<CR>
" カレントディレクトリ配下のファイルに対して grep(ag)
noremap <Leader><C-g> :<C-u>Denite grep    -buffer-name=search-buffer-denite<CR>
noremap <Leader><C-r> :<C-u>Denite -resume -buffer-name=search-buffer-denite<CR>
" function outline 表示
noremap <C-f> :<C-u>Denite unite:outline<CR>


" deoplete settings
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_yarp = 1

" deoplete-go
let g:deoplete#sources#go#gocode_binary = $GOPATH.'bin/gocode'
let g:deoplete#sources#go#package_dot = 1
let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']
let g:deoplete#sources#go#pointer = 1
set completeopt+=noinsert
set completeopt+=noselect

"" neosnippet
" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
imap <expr><TAB>
 \ pumvisible() ? "\<C-n>" :
 \ neosnippet#expandable_or_jumpable() ?
 \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
    set conceallevel=2 concealcursor=niv
    autocmd FileType json setl conceallevel=0 
endif


" lightline settings
if has("unix")
    let g:lightline = {
          \ 'colorscheme': 'wombat',
          \ }
elseif has("mac")
    let g:lightline = {
          \ 'colorscheme': 'wombat',
          \ 'active': {
          \   'left': [ [ 'mode', 'paste' ],
          \             [ 'fugitive', 'filename' ] ]
          \ },
          \ 'component_function': {
          \   'fugitive': 'LightlineFugitive',
          \   'readonly': 'LightlineReadonly',
          \   'modified': 'LightlineModified',
          \   'filename': 'LightlineFilename'
          \ },
          \ 'separator': { 'left': '⮀', 'right': '⮂' },
          \ 'subseparator': { 'left': '⮁', 'right': '⮃' }
          \ }
    
    function! LightlineModified()
      if &filetype == "help"
        return ""
      elseif &modified
        return "+"
      elseif &modifiable
        return ""
      else
        return ""
      endif
    endfunction
    
    function! LightlineReadonly()
      if &filetype == "help"
        return ""
      elseif &readonly
        return "⭤"
      else
        return ""
      endif
    endfunction
    
    function! LightlineFugitive()
      return exists('*fugitive#head') ? fugitive#head() : ''
    endfunction
    
    function! LightlineFilename()
      return ('' != LightlineReadonly() ? LightlineReadonly() . ' ' : '') .
           \ ('' != expand('%:t') ? expand('%:t') : '[No Name]') .
           \ ('' != LightlineModified() ? ' ' . LightlineModified() : '')
    endfunction
endif

if !has('gui_running')
    set t_Co=256
endif

augroup reload_vimrc
    autocmd!
    autocmd BufWritePost $MYVIMRC nested source $MYVIMRC
augroup END


"vim-go setteings
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_fmt_command = "goimports"
au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dt <Plug>(go-def-tab)
au FileType go nmap <Leader>gd <Plug>(go-doc)


"" caw
nmap <Leader>c <Plug>(caw:hatpos:toggle)
vmap <Leader>c <Plug>(caw:hatpos:toggle)


" vim-indent-guides
let g:indent_guides_auto_colors=0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd   ctermbg=237
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven  ctermbg=235
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_guide_size=1


"" quickrun
let g:quickrun_config={
    \ '*': {'outputter/buffer/split': '10',
    \       'hook/time/enable': '1'}
    \ }
set splitbelow


"" table mode
let g:table_mode_corner_corner="+"
let g:table_mode_header_fillchar="="


"" global settings
" map <Leader><C-g> :Gtags
" map <Leader><C-h> :Gtags -f %<CR>
" map <Leader><C-j> :GtagsCursor<CR>
" map <C-m> :cn<CR>
" map <C-b> :cp<CR>


"" winresizer settings
let g:winresizer_start_key = '<Leader><C-E>'


"" easymotion settings
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
