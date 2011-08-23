set undofile
set undodir=i:\TMP
set hid " you can change buffer without saving
set shortmess=atI " shortens messages to avoid 'press a key' prompt
set report=0 " tell us when anything is changed via :...
set lz " do not redraw while running macros (much faster) (LazyRedraw)
set updatecount=0
set updatetime=1000

set ai
set smartindent
set smarttab " use tabs at the start of a line, spaces elsewhere
set softtabstop=4
set formatoptions+=mM " so that vim can reformat multibyte text (e.g. Chinese)

set diffopt=iwhite,horizontal
set go=
set ch=3

set ignorecase
set smartcase
" set cursorline
set makeprg=myCompile.bat
"set efm =\"%f\"\\,\ line\ %l:%m
"set path=.,,C:/Program\\\ Files/Analog\\\ Devices/VisualDSP\\\ 5.0/Blackfin/include
command! CD cd %:p:h
command! LCD lcd %:p:h
command! TR %s/[ \t\r]\+$//e | set nomod
command! TRR %s/[ \t\r]\+$//e
let Tlist_Display_Prototype = 0
let Tlist_Auto_Open = 0
let Tlist_File_Fold_Auto_Close = 1
let Tlist_Enable_Fold_Column = 0
let Tlist_Sort_Type = "name"
let tlist_asm_settings = 'asm;l:Label'

let $LANG='en'

let g:DoxygenToolkit_blockHeader="--------------------------------------------"
let g:DoxygenToolkit_blockFooter="--------------------------------------------"
let g:DoxygenToolkit_authorName="Chris Lee"
let g:DoxygenToolkit_licenseTag="Copyright Digiwell.com.tw. All rights reserved.\<enter>"
	"<-- Do not forget ending "\<enter>"
let g:DoxygenToolkit_undocTag="DOXIGEN_SKIP_BLOCK"
"# default use /**...*/ as comment. With this option /// comments are used.
"let g:DoxygenToolkit_commentType="C++"
let g:DoxygenToolkit_briefTag_funcName = "yes"  " to include function name between briefTag_pre and briefTag_post

" let g:EnhCommentifyUserBindings = 'yes'
"let g:C_LineEndCommColDefault    = 42
"let g:C_ObjExtension = ".doj"
"let g:C_ExeExtension = ".dxe"
"let g:C_CCompiler = "ccblkfn.exe"
"let g:C_CplusCompiler = "ccblkfn.exe"
"let g:C_CFlags = "-c -Wterse -I ./ -I ../"

" set nowrap
" set textwidth=132
" set guioptions=egmrLtTbh
" set foldmethod=syntax

"nmap [[ ?{<CR>w99[{
"nmap ][ /}<CR>b99]}
"nmap ]] j0[[%/{<CR>
"nmap [] k$][%?}<CR>

"verilog port and parameter mapping macro
"map , :s/^.*\(\<\w*\>\)\s*,/.\1(\1),/<CR>j
"map ; :s/parameter\s\+\(\<\w*\>\)\s*=\s*\(\<\w*\>\)/.\1(\2)/<CR>j

nmap  <silent> <F7>    :cp<CR>
nmap  <silent> <F8>    :cn<CR>
nmap <F12> :Tlist<CR>
nmap <F6> :make<CR>
nmap <f3> :execute "vimgrep /" . expand("<cword>") . "/j **/*"<Left>
nnoremap <F4>a :DoxAuthor<CR>
nnoremap <F4>b :DoxBlock<CR>
let bug=''
nnoremap <F4>C O/** ChrisLee <C-R>=strftime("%x")<CR>, #<C-R>=bug<CR> */<left><left><left>
nnoremap <F4>c o/** ChrisLee <C-R>=strftime("%x")<CR>, #<C-R>=bug<CR> */<left><left><left>
nnoremap <F4>f :Dox<CR>
nnoremap <F4>l :let bug=""<left>
nnoremap <F4>v A /**< ChrisLee <C-R>=strftime("%x")<CR>, #<C-R>=bug<CR> */<left><left><left>
nnoremap <Space> @q
"nmap cf :let @" = expand("%")<CR>
"nmap cp :let @" = expand("%:p")<CR>

""""""""""""""""""""""""""""""""""""""""""""""
""omni completion 
""""""""""""""""""""""""""""""""""""""""""""""
set ofu=syntaxcomplete#Complete
set cot=menu
imap <silent> ` <C-X><C-O>

if has("cscope")
	set csprg=D:\bin\cscope.exe
	set cscopequickfix=s-,c-,d-,i-,t-,e-
	set csto=0
	set cst
	set nocsverb
	nmap <C-F11> :cs kill -1<CR>:!myCscope.bat<CR>:cs add cscope.out.trim<CR>
	nmap <F11> :cs kill -1<CR>:!myCscopeOnly.bat<CR>:cs add cscope.out.trim<CR>
	" add any database in current directory
	if filereadable("cscope.out.trim")
		cs add cscope.out.trim
	" else add database pointed to by environment
	elseif $CSCOPE_DB != ""
		cs add $CSCOPE_DB
	endif
	set csverb
	nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
	nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>
	nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>
	nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>
	nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>
	nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
	nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
	nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>
	nmap <C-\>G :only<CR>:split<CR>:wincmd j<CR>:cs find g <C-R>=expand("<cword>")<CR><CR>
"    command! -nargs=1 Csf cs find f <args>
"    command! -nargs=1 Csg cs find g <args>
"    command! -nargs=1 Csi cs find i <args>

	" Using 'CTRL-spacebar' then a search type makes the vim window
	" split horizontally, with search result displayed in
	" the new window.

	nmap <C-\>S :scs find s <C-R>=expand("<cword>")<CR><CR>
	nmap <C-\>G :scs find g <C-R>=expand("<cword>")<CR><CR>
	nmap <C-\>C :scs find c <C-R>=expand("<cword>")<CR><CR>
	nmap <C-\>T :scs find t <C-R>=expand("<cword>")<CR><CR>
	nmap <C-\>E :scs find e <C-R>=expand("<cword>")<CR><CR>
	nmap <C-\>F :scs find f <C-R>=expand("<cfile>")<CR><CR>
	nmap <C-\>I :scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
	nmap <C-\>D :scs find d <C-R>=expand("<cword>")<CR><CR>

"     Hitting CTRL-space *twice* before the search type does a vertical
"     split instead of a horizontal one

	nmap <C-/><C-/>s :vert scs find s <C-R>=expand("<cword>")<CR><CR>
	nmap <C-/><C-/>g :vert scs find g <C-R>=expand("<cword>")<CR><CR>
	nmap <C-/><C-/>c :vert scs find c <C-R>=expand("<cword>")<CR><CR>
	nmap <C-/><C-/>t :vert scs find t <C-R>=expand("<cword>")<CR><CR>
	nmap <C-/><C-/>e :vert scs find e <C-R>=expand("<cword>")<CR><CR>
	nmap <C-/><C-/>i :vert scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
	nmap <C-/><C-/>d :vert scs find d <C-R>=expand("<cword>")<CR><CR>

endif

if has("autocmd")

	autocmd BufEnter *.v set errorformat=\*\*\ %tRROR:\ %f(%l):\ %m,\*\*\ %tRROR:\ %m,\*\*\ %tARNING:\ %m,\*\*\ %tOTE:\ %m,%tRROR:\ %f(%l):\ %m,%tARNING\[%*[0-9]\]:\ %f(%l):\ %m,%tRROR:\ %m,%tARNING\[%*[0-9]\]:\ %m
	autocmd BufEnter *.c set efm =\"%f\"\\,\ line\ %l\ (col.\ %c):\ %m

"    autocmd BufWritePre *.c :RetabIndent!
"    autocmd BufWritePre *.h :RetabIndent!
"    autocmd BufEnter * :%s/[ \t\r]\+$//e
"    autocmd BufEnter *.ahk :let &titlestring = "VIM[" . expand("%:p") . "]"

	" vim -b : edit binary using xxd-format!
"    augroup Binary
"      au!
"      au BufReadPre  *.iso let &bin=1
"      au BufReadPost *.iso if &bin | %!xxd
"      au BufReadPost *.iso set ft=xxd | endif
"      au BufWritePre *.iso if &bin | %!xxd -r
"      au BufWritePre *.iso endif
"      au BufWritePost *.iso if &bin | %!xxd
"      au BufWritePost *.iso set nomod | endif
"    augroup END

endif " has("autocmd")


set nocompatible
filetype plugin on
set completeopt-=preview
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin
nunmap <C-A>
iunmap <C-Y>
nunmap <C-S>
vunmap <C-S>
ounmap <C-S>
noremap <C-S> :s/\([^ =]*\)\([ ]*\)=[ ]*\([^;]*\);/\3 = \1;/<CR>:nohl<CR>
"set diffexpr=MyDiff()
"function MyDiff()
"  let opt = '-a --binary '
"  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
"  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
"  let arg1 = v:fname_in
"  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
"  let arg2 = v:fname_new
"  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
"  let arg3 = v:fname_out
"  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
"  let eq = ''
"  if $VIMRUNTIME =~ ' '
"    if &sh =~ '\<cmd'
"      let cmd = '""' . $VIMRUNTIME . '\diff"'
"      let eq = '"'
"    else
"      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
"    endif
"  else
"    let cmd = $VIMRUNTIME . '\diff'
"  endif
"  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
"endfunction

if has("multi_byte")
	set encoding=utf-8 "vim 內部存放編碼
"    setglobal fileencoding=utf-8 bomb "new file encoding
	setglobal fileencoding=big5 "new file encoding
	"        set fileencoding=big5 "read/write file encoding, convertion occur if diff with encoding
	set bomb
	set fileencodings=ucs-bom,big5,utf-8,euc-jp,gbk,euc-kr,iso8859-1
	"set guifont=-misc-fixed-medium-r-normal-*-18-120-100-100-c-90-iso10646-1
	"set guifontwide=-misc-fixed-medium-r-normal-*-18-120-100-100-c-180-iso10646-1
	"        let $LANG='en'
	"    else
	"        echoerr "Sorry, this version of (g)vim was not compiled with multi_byte"
" Walkaround the encoding problem for fenc=utf-8 && enc=ucs-2
"  augroup i18n
"      autocmd!
"      autocmd BufReadPost * if &fileencoding == "utf-8" | if &bomb == 0 | let &bomb = 1 | let &mod = 1 | endif | endif
"  augroup END
endif

if has("win32")
    source $VIMRUNTIME/delmenu.vim
    source $VIMRUNTIME/menu.vim
    set guifont=YaHei\ Consolas\ Hybrid:h12 "Courier_New:h10
    set guifontwide=YaHei\ Consolas\ Hybrid:h12
    set lines=40
    set columns=100
"    set number
    set shiftwidth=4
    set tabstop=4
	set nobackup
	set nowritebackup
	set backupdir=$TMP\\\\
	set directory=$TMP\\\\
	"set guioptions-=m
"    set guioptions-=T
	"set guioptions-=r
	"set guioptions-=b

	" Folding
"    let g:xml_syntax_folding=1
"    set foldmethod=syntax
"    set foldlevel=100 " Don't autofold anything (but I can still fold manually)
	colorscheme elflord

endif

" columnise a csv file for display only as may crop wide columns
":let width = 20
":let fill=' ' | while strlen(fill) < width | let fill=fill.fill | endwhile
":%s/\([^;]*\);\=/\=strpart(submatch(1).fill, 0, width)/ge
":%s/\s\+$//ge
" Highlight a particular csv column (put in .vimrc)
function! CSVH(x)
    execute 'match Keyword /^\([^,]*,\)\{'.a:x.'}\zs[^,]*/'
    execute 'normal ^'.a:x.'f,'
endfunction
command! -nargs=1 Csv :call CSVH(<args>)
" call with
":Csv 5                             : highlight fifth column

