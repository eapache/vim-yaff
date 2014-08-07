function yaff#ListFiles()
  new YaffList
  setlocal buftype=nofile
  setlocal bufhidden=hide
  setlocal noswapfile

  let files = split(globpath('.', '**'), '\n')
  call setline(1, files)
  call cursor(1, 1)
  call feedkeys("/\\V")

  setlocal nomodifiable
endfunction

function s:ChooseFile()
  let file = getline(".")
  bdelete
  execute 'edit' fnameescape(file)
endfunction

function s:Enter()
  nmap <silent> <buffer> <CR> :call <SID>ChooseFile()<CR>
  nmap <silent> <buffer> <Esc> :bdelete<CR>
  nmap <silent> <buffer> <C-c> :bdelete<CR>
  nmap <silent> <buffer> q :bdelete<CR>
endfunction

augroup Yaff
  autocmd BufWinEnter YaffList call <SID>Enter()
  autocmd BufWinLeave YaffList bdelete
augroup END
