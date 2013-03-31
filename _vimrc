set nocompatible
source $VIMRUNTIME/vimrc_example.vim
"source $VIMRUNTIME/mswin.vim
"behave mswin
set nobackup
set fenc=utf-8
set fencs=utf-8,gbk
set nobomb
set nu
set ts=4
set sw=4
set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction

"快捷键
imap jj <esc>
map <tab> :bp<cr> 
map ,, :FufCoverageFile!<cr>
map ,n :NERDTreeToggle<cr>



syntax enable
set background=light
colorscheme evening
call pathogen#infect()
let g:neocomplcache_enable_at_startup = 1


"开启光亮光标行 
 set cursorline
hi CursorLine   cterm=NONE ctermbg=darkgrey ctermfg=white guibg=darkgrey 
"开启高亮光标列
set cursorcolumn
hi CursorColumn cterm=NONE ctermbg=darkgrey ctermfg=white guibg=darkgrey guifg=white
let location="d:/www/"
execute ":cd " . location
let @z=expand("%:p:h")


    " 在浏览器预览 for win32
    function! ViewInBrowser(name)
        let file = expand("%:p")
        exec ":update " . file
        let l:browsers = {
            \"ie":"C:/progra~1/intern~1/iexplore.exe",
        \}
        let htdocs='D:\\www\\'
        let strpos = stridx(file, substitute(htdocs, '\\\\', '\', "g"))
        if strpos == -1
           exec ":silent !start ". l:browsers[a:name] ." file://" . file
        else
            let file=substitute(file, htdocs, "http://127.0.0.1:80/", "g")
            let file=substitute(file, '\\', '/', "g")
            exec ":silent !start ". l:browsers[a:name] file
        endif
    endfunction
    nmap <f4>ie :call ViewInBrowser("ie")<cr>

	
