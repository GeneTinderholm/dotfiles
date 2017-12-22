execute pathogen#infect()
syntax on
filetype plugin indent on
set number
set clipboard=unnamedplus
set background=dark
set tabstop=2
set shiftwidth=2
set expandtab
set fillchars+=vert:┃
set incsearch
set hlsearch
set nofoldenable
let g:rainbow_active = 1
let NERDTreeHijackNetrw = 0
let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+'
let g:solarized_termcolors=16
if has('gui_running')
	colorscheme solarized8_high
	:set lines=30 columns=100
	:set guioptions-=m  "remove menu bar
	:set guioptions-=T  "remove toolbar
	:set guioptions-=r  "remove right-hand scroll bar
	:set guioptions-=L  "remove left-hand scroll bar
	:set guifont=Hack\ 13
else
	if(&term == "xterm-256color")
		let g:solarized_use16 = 1
    set termguicolors
		set t_8f=[38;2;%lu;%lu;%lum
		set t_8b=[48;2;%lu;%lu;%lum
		" colorscheme solarized8_high
    " colorscheme onedark
    " colorscheme gruvbox
    colorscheme one
	else
		set t_Co=256
		colorscheme gruvbox
	endif
endif

let mapleader = "\<Space>"

let g:vimshell_prompt_expr =  'escape(fnamemodify(getcwd(), ":~").">", "\\[]()?! ")." "'
let g:vimshell_prompt_pattern = '^\%(\f\|\\.\)\+> '

set laststatus=2
set timeoutlen=1000 ttimeoutlen=0

nnoremap <silent> <leader>ft :NERDTreeToggle<CR>
nnoremap <silent> <leader>f :Autoformat<CR>
nnoremap <silent> <leader>wh <c-w><c-h>
nnoremap <silent> <leader>wj <c-w><c-j>
nnoremap <silent> <leader>wk <c-w><c-k>
nnoremap <silent> <leader>wl <c-w><c-l>
nnoremap <silent> <leader>w= <c-w><c-=>
nnoremap <silent> <leader>h :bp<CR>
nnoremap <silent> <leader>l :bn<CR>
nnoremap <silent> <leader><CR> :noh<CR>
nnoremap <silent> <leader>ff :Files<CR>
nnoremap <silent> <leader>bb :Buffers<CR>
nnoremap <silent> <leader>c o<CR><ESC>k:TComment<CR>A----------------------------------------<ESC>o<CR><ESC>A----------------------------------------<ESC>kA
nnoremap <silent> <leader>e :call JSFormat()<cr>

function! JSFormat()
	" Preparation: save last search, and cursor position.
	let l:win_view = winsaveview()
	let l:last_search = getreg('/')
	let fileWorkingDirectory = expand('%:p:h')
	let currentWorkingDirectory = getcwd()
	execute ':lcd' . fileWorkingDirectory
	execute ':silent' . '%!esformatter'
	if v:shell_error
		undo
		"echo "esformatter error, using builtin vim formatter"
		" use internal formatting command
		execute ":silent normal! gg=G<cr>"
	endif
	" Clean up: restore previous search history, and cursor position
	execute ':lcd' . currentWorkingDirectory
	call winrestview(l:win_view)
	call setreg('/', l:last_search)
endfunction

map <silent> <F11>
			\    :call system("wmctrl -ir " . v:windowid . " -b toggle,fullscreen")<CR>

if has("persistent_undo")
	set undodir=~/.undodir/
	set undofile
endif

nnoremap <silent> <leader>u :UndotreeToggle<CR>

let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:DevIconsEnableFoldersOpenClose = 1

if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.maxlinenr = ''
let g:airline_extensions = ['tabline']
let g:airline_highlighting_cache=1

let g:rainbow_conf = {
      \  'separately': {
      \    'nerdtree': 0
      \  }
      \}

" let g:rainbow_conf = {
"   \   'guifgs': ['#4F97D7', '#D75F87', '#D697E6', '#40AF81', '#DA61AE', '#70AF67'],
"   \   'ctermfgs': ['68', '168', '176', '104', '73', '212'],
"   \   'operators': '_,_',
"   \   'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
"   \   'separately': {
"   \       '*': {},
"   \       'tex': {
"   \           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
"   \       },
"   \       'lisp': {
"   \           'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', '#FF69B4', '#DDA0DD', '#F08080', '#FF8C00', '#20B2AA'],
"   \       },
"   \       'vim': {
"   \           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
"   \       },
"   \       'html': {
"   \           'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
"   \       },
"   \       'css': 0,
" 	\		    'nerdtree': 0
"   \   }
"   \}

" let g:rbpt_max = 16
" let g:rbpt_loadcmd_toggle = 0
" let g:rbpt_colorpairs = [
"     \ ['brown',       'RoyalBlue3'],
"     \ ['Darkblue',    'SeaGreen3'],
"     \ ['darkgray',    'DarkOrchid3'],
"     \ ['darkgreen',   'firebrick3'],
"     \ ['darkcyan',    'RoyalBlue3'],
"     \ ['darkred',     'SeaGreen3'],
"     \ ['darkmagenta', 'DarkOrchid3'],
"     \ ['brown',       'firebrick3'],
"     \ ['gray',        'RoyalBlue3'],
"     \ ['black',       'SeaGreen3'],
"     \ ['darkmagenta', 'DarkOrchid3'],
"     \ ['Darkblue',    'firebrick3'],
"     \ ['darkgreen',   'RoyalBlue3'],
"     \ ['darkcyan',    'SeaGreen3'],
"     \ ['darkred',     'DarkOrchid3'],
"     \ ['red',         'firebrick3'],
"     \ ]
"
" au VimEnter * RainbowParenthesesToggle
" au Syntax * RainbowParenthesesLoadRound
" au Syntax * RainbowParenthesesLoadSquare
" au Syntax * RainbowParenthesesLoadBraces
