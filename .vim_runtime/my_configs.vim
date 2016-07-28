
"================== 기본 변수 설정 ======================
set nu
set cindent
set smartindent
set autoindent
set nowrap
set ff=unix
set bg=dark
set ruler
set path=/root/work/include,/usr/include,/usr/local/include,/usr/src/include
colorscheme seoul256

"================= file buffer mapping ==========================
map ,1 :b!1<CR>
map ,2 :b!2<CR>
map ,3 :b!3<CR>
map ,4 :b!4<CR>
map ,5 :b!5<CR>
map ,6 :b!6<CR>
map ,7 :b!7<CR>
map ,8 :b!8<CR>
map ,9 :b!9<CR>
map ,0 :b!10<CR>
map ,x :bn!<CR>
map ,z :bp!<CR>
map ,w :bw!<CR>

set tags=./tags,../tags,../../tags,/usr/include/tags,/usr/local/include/tags,~/work/linux-4.6.3/tags


"================ indent configure =======================
map ,noi :set noai<CR> :set nocindent<CR> :set nosmartindent<CR>
map ,sei :set ai<CR> :set cindent<CR> :set smartindent<CR>


"================ air-line=====================
let g:airline#extensions#tabline#enabled= 1
let g:airline#extensions#tabline#fnamemode= ':t'
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

"================ key mapping =====================
map <F2> v]}zf
map <F3> zo
map <F4> :Tlist<cr><C-W><C-W>
map <F5> :reg<cr>
map <F6> :marks<cr>
map <F9> :Goyo<cr>
map <F7> :bd!<cr>
map <F8> ,t,<cr>
map <PageUp> <C-U><C-U>
map <PageDown> <C-D><C-D>

"================ ctag configure ==================
if version >= 500
func! Sts()
	let st = expand("<cword>")
	exe "sts ".st
endfunc
nmap ,st :call Sts()<cr>

func! Tj()
	let st = expand("<cword>")
	exe "tj ".st
endfunc
nmap ,tj :call Tj()<cr>
endif

"=============== cscope configure ========================
set csprg=/usr/bin/cscope
set nocsverb
cs add /root/work/linux-4.6.3/cscope.out
set csverb
set csto=0
set cst

func! Css()
	let css = expand("<cword>")
	new
	exe "cs find s ".css
	if getline(1)== ""
		exe "q!"
	endif
endfunc
nmap ,css :call Css()<cr>

func! Csc()
	let csc = expand("<cword>")
	new
	exe "cs find c ".csc
	if getline(1)== ""
		exe "q!"
	endif
endfunc
nmap ,csc :call Csc()<cr>

func! Csd()
	let csd = expand("<cword>")
	new
	exe "cs find d ".csd
	if getline(1) == ""
		exe "q!"
	endif
endfunc
nmap ,csd :call Csd()<cr>

func! Csg()
	let csg = expand("<cword>")
	new
	exe "cs find g ".csg
	if getline(1) == ""
		exe "q!"
	endif
endfunc
nmap ,csg :call Csg()<cr>

"=============== man page ====================

func! Man()
    let sm = expand("<cword>")
	exe "!man -S ko:2:3:4:5:6:7:8:9:tcl:n:l:p:o ".sm
endfunc
nmap ,ma :call Man()<cr><cr>


"================ vundle configure ========================
set nocompatible
filetype off
set rtp+=~/.vim_runtime/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'
Bundle 'git://git.wincent.com/command-t.git'
filetype plugin indent on

Plugin 'ctags.vim'
Plugin 'taglist.vim'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'hinza/vim-snippets'

