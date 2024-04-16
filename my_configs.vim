highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/
let mapleader = ","

if has("cscope")
	set cscopetag
	set csprg=/usr/bin/cscope
	" check cscope for deifinition of a symbol before checking ctags: set
	" to 1 if you want the reverse search order.
	set csto=0
	set cst
	set nocsverb
	" add any database in current directory
	if filereadable("cscope.out")
		cs add cscope.out
	" else add database pointed to by environment
	elseif $CSCOPE_DB != ""
		cs add $CSCOPE_DB
	endif
	set cscopeverbose	" show msg when any other cscope db added
	set csverb
endif

nmap <C-@>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-@>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-@>d :cs find d <C-R>=expand("<cword>")<CR><CR>

ab CR: CRs-fixed
ab sob: signed-of-by

let g:Tlist_Ctags_Cmd = '/usr/bin/ctags'
""noremap ^[OD <C-Left>
""noremap ^[OC <C-Right>
nmap ^[D <Left>
nmap ^[C <Right>
""map! ^[[OD <C-Left>
""map! ^[[OC <C-Right>

"nnoremap ^[[OD :bprev<CR>
"nnoremap ^[[OC <bnext<CR>
nmap <C-Left>	:bprev<CR>
nmap <C-Right>	:bnext<CR>
nmap <C-j>	:bprev<CR>
nmap <C-k>	:bnext<CR>
nnoremap ^[[1;5D	:bprev<CR>
nnoremap ^[[1,5C	:bnext<CR>
nnoremap ^[[D		:bprev<CR>
nnoremap ^[[C		:bnext<CR>

nmap <F2>		:TlistToggle<CR>
nmap <C-f>		:MRU<CR>
"nmap <C-s>		[s1z='Ja
nmap <Leader>s	:source ~/bin/autocorrect.vim<cr>

syntax on
set ruler		" show the line number on the bar
set more		" use more prompt
set autoread		" watch for file changes
set number		" line numbers
set hidden
set noautowrite		" don't automatically write on :next
set lazyredraw		" don't redraw when don't have to
set showmode
set showcmd
set nocompatible	" vim, not vi
set autoindent smartindent	" auto/smart indent
set smarttab		" tab and backspace are smart
set scrolloff=5		" keep at least 5 lines above/below
set sidescrolloff=5	" keep at least 5 lines left/right
set history=200
"set backspace=indent,eol,start
set linebreak
"set cmdheight=2	" command line two lines high
set undolevels=1000	" 1000 undos
set updatecount=100	" switch every 100 chars
set complete=.,w,b,u,U,t,i,d	" do lots of scanning on tab completion
set ttyfast		" we have a fast terminal
set noerrorbells	" No error bells please
set shell=bash
set fileformats=unix
set ff=unix
filetype on		" Enable filetype detection
filetype indent on	" Enable filetype-specific indenting
filetype plugin on	" Enable filetype-specific plugin
set wildmode=longest:full
set wildmenu		" menu has tab completion
"set maplocalleader=','	" all my macros start with ,
set laststatus=2

"  searching
set incsearch			" incremental search
set ignorecase			" search ignoring case
set smartcase			" Override the ignorecase if searching for capital letters
set hlsearch			" highlight the search
set showmatch			" show matching bracket
set diffopt=filler,iwhite	" ignore all whitespace and sync
set wildmenu			" Enable auto completion menu after pressing TAB
set wildmode=list:longest	" Make wildmenu behave like similar to Bash comletion

" backup
"set backup
"set backup=~/.vim_backup
"set viminfo='10,\"100,:20,%,n~/.viminfo
set viminfo=%100,'100,/100,h,\"500,:100,n~/.viminfo
"set viminfo='100,f1

" spelling
"if v:version >= 700
  " Enable spell check for text files
  " automd BufNewFile,BufRead *.text setlocal spell spelllang=en
"endif

" mappings
" toggle list mode
nmap <LocalLeader>tl :set list!<cr>
" toggle paste mode
nmap <LocalLeader>pp :set paste!<cr>

" go to last position
au BufReadPost * if line("'\'") > 1 && line("'\'") <= line("$") | exe "normal! g'\"" | endif

if has("gui_running")
		set guifront=Inconsolata\ 14
		set guioptions-=m
		set guioptions-=T
		colo pyte
		"set background=dark
		"colo solarized
else
		set t_Co=256
		set background=dark
		"colorscheme solarized
		"colorscheme railcasts
		"colorscheme peaksea
		"colorscheme pyte
endif

let g:miniBufExplMapWindowNavVim = 1
let g:minBufExplMapWindowNavArrowa = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModeSelTarget = 1
map <Esc>[B <Down>

if &term =~ '^screen'
	" set mouse+=a
	" tmux knows the extended mouse mode
	" set ttymouse=xterm2
	" tmux will send xterm-style keys when xterm-keys is on
	execute "set <xUp>=\e[1;*A"
	execute "set <xDown>=\e[1;*B"
	execute "set <xRight>=\e[1;*C"
	execute "set <xLeft>=\e[1;*D"
	execute "set <xHome>=\e[1;*H"
	execute "set <xEnd>=\e[1;*F"
	execute "set <Insert>=\e[2;*~"
	execute "set <Delete>=\e[3;*~"
	execute "set <PageUp>=\e[5;*~"
	execute "set <xF1>=\e[1;*P"
	execute "set <xF2>=\e[1;*Q"
	execute "set <xF3>=\ei[1;*R"
	execute "set <xF4>=\e;[1*S"
	execute "set <xF5>=\e;[15*~"
	execute "set <xF6>=\e;[17*~"
	execute "set <xF7>=\e;[18*~"
	execute "set <xF8>=\e;[19*~"
	execute "set <xF9>=\e;[20*~"
	execute "set <xF10>=\e;[21*~"
	execute "set <xF11>=\e;[23*~"
	execute "set <xF12>=\e;[24*~"
endif
