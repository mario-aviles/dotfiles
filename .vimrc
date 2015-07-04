 set tags+=gems.tags

" FOR VUNDLE PLUGIN MANAGER 
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
" Para instalar con :PluginInstall
Plugin 'gmarik/Vundle.vim'
"Plugin 'Valloric/YouCompleteMe'
Plugin 'kien/ctrlp.vim'
" los tres plugin siguientes son para instalar snippets y sus dependencias 
  Plugin 'MarcWeber/vim-addon-mw-utils'
  Plugin 'tomtom/tlib_vim'
  Plugin 'garbas/vim-snipmate'
"Plugin 'tpope/vim-rails'
"Plugin 'junegunn/goyo.vim'" editor de texto tipo ia writer 
Plugin 'jaxbot/browserlink.vim'
"<script src='http://127.0.0.1:9001/js/socket.js'></script>

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" --------------------------------------------
call pathogen#infect()


" CONFIGURACIONES ESTANDAR
filetype plugin indent on
set number
" hace que el archivo se actualize si se modifica desde fuera
set autoread
"ignora mayusculas al buscar
set ignorecase 
set autoindent
let delimitMate_expand_cr = 1
set clipboard=unnamed             " use the system clipboard
syntax enable
"au BufNewFile,BufRead *.txt set filetype=markdown
setlocal spelllang=es_mx
" pone 4 espacios en lugar de tabs 
set tabstop=4 
set shiftwidth=4
" seleccionas mientra se escribe el patron
set incsearch
set hlsearch
" activa el mouse para doble click
set mouse=a
set nocompatible
" usa el clipboard del sistema
set clipboard=unnamedplus


" ATAJOS DE TECLADO O REMAPS ---------------------------------
" PARA CTRLP FUNKY -> BUSCAR METHODOS 
map <F5> :call Compilar()<CR>
silent! map <F3> :NERDTreeToggle <CR>
" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l


" COLORES VIM -------------------------------------------------
if &term!="xterm"
	set t_Co=256            
endif
set background=dark
colorscheme seoul256

" FUNCIONES -----------------------------------------------------
func! Compilar()
	exec "w"
	if &filetype == 'c'
		exec "!gcc % -o %<"
		exec "!time ./%<"
	elseif &filetype == 'cpp'
		exec "!g++ % -o %<"
		exec "!time ./%<"
	elseif &filetype == 'java'
		exec "!javac %"
		exec "!time java -cp %:p:h %:t:r"
	elseif &filetype == 'cs'
		exec "!gmcs %"
		exec "!time mono -cp %:p:h %:t:r"
	elseif &filetype == 'sh'
		exec "!time bash %"
	elseif &filetype == 'python'
		exec "!time python2.7 %"
	elseif &filetype == 'ruby'
		exec "!time ruby %"
	elseif &filetype == 'html'
		exec "!firefox % &"
	elseif &filetype == 'go'
		exec "!go build %<"
		exec "!time go run %"
	elseif &filetype == 'mkd'
		exec "!~/.vim/markdown.pl % > %.html &"
		exec "!firefox %.html &"
	elseif &filetype == 'markdown'
		exec "! pandoc % -o %:r.docx --reference-docx=\"/home/m/Plantillas/apamio.docx\"  "
	endif
endfunc


