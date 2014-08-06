function ListFiles()
  new FileFinder
  let files = split(globpath('.', '**'))
  call setline(1, files)
  set nomodifiable
  call cursor(1, 1)
  call feedkeys("/\\V")
endfunction

function Enter()
  nmap <CR> :call ChooseFile()<CR>
  nmap <Esc> :call Exit()<CR>
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

au BufEnter FileFinder call Enter()
