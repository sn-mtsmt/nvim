filetype plugin on

" ---------------------------------
" install dein and other plugins
" ---------------------------------
" dein installed directory
let s:dein_dir = expand('~/.cache/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

" dein install check if not installed then download dein
if &runtimepath !~# '/dein.vim'
	if !isdirectory(s:dein_repo_dir)
		execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
	endif
	execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':P')
endif

if dein#load_state(s:dein_dir)
	call dein#begin(s:dein_dir)

	let g:rc_dir = expand('~/.config/nvim/dein')
	let s:toml = g:rc_dir . '/dein.toml'
	let s:lazy_toml = g:rc_dir . '/dein_lazy.toml'

	call dein#load_toml(s:toml, {'lazy' : 0})
	call dein#load_toml(s:lazy_toml, {'lazy' : 1})

	call map(dein#check_clean(), "delete(v:val, 'rf')")
	call dein#recache_runtimepath()

	call dein#end()
	call dein#save_state()
endif

if dein#check_install()
	call dein#install()
endif


" ---------------------------------
" default setting
" ---------------------------------
syntax on
colorscheme default 

set number
set noswapfile
set autoread
set shiftwidth=4
set tabstop=4
set cmdheight=2
set laststatus=2
set wildmenu
set history=5000
set inccommand=split

" ---------------------------------
" Insert mode key bind
" ---------------------------------
inoremap <C-j> <Esc>

" --------------------------------
" Normal mode key bind
" ---------------------------------
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l


