function yaff#ListFiles()
  new FileFinder
  let files = split(globpath('.', '**'))
  call setline(1, files)
  set nomodifiable
  call cursor(1, 1)
  call feedkeys("/\\V")
endfunction

function s:ChooseFile()
  let file = getline(".")
  call <SID>Exit()
  execute 'edit' fnameescape(file)
endfunction

function s:Enter()
  nmap <CR> :call <SID>ChooseFile()<CR>
  nmap <Esc> :call <SID>Exit()<CR>
endfunction

function s:Exit()
  bdelete!
  set modifiable
endfunction

au BufEnter FileFinder call <SID>Enter()
