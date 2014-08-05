function ListFiles()
  new FileFinder
  let files = split(globpath('.', '**'))
  call setline(1, files)
  set nomodifiable
  call cursor(1, 1)
  call feedkeys("/")
endfunction

function Exit()
  bdelete!
  set modifiable
endfunction

function ChooseFile()
  let file = getline(".")
  call Exit()
  execute 'edit' fnameescape(file)
endfunction

map <C-p> :call ListFiles()<CR>

au BufEnter FileFinder nmap <CR> :call ChooseFile()<CR>
au BufEnter FileFinder nmap <Esc> :call Exit()<CR>
