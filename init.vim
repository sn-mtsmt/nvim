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

" load toml file
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

" download plugins 
if dein#check_install()
	call dein#install()
endif

" ---------------------------------
" default setting
" ---------------------------------
" view
syntax on
colorscheme default 
set title
set number

" tab & indent
set expandtab
set tabstop=2
set shiftwidth=2
set autoindent
set smartindent
set smarttab

" others
set wildmenu
set nowrap
set noswapfile
set nobackup
set nowritebackup
set autoread
set cmdheight=2
set laststatus=2
set history=5000
set inccommand=split
set hidden
set clipboard+=unnamed

" ---------------------------------
" key mapping
" ---------------------------------
" Insert mode
inoremap <C-j> <Esc>

" Normal mode
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Terminal mode
tnoremap <silent> <ESC> <C-\><C-n>
