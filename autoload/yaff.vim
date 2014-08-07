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
  nmap <silent> <buffer> <CR> :call <SID>ChooseFile()<CR>
  nmap <silent> <buffer> <Esc> :bdelete<CR>
  nmap <silent> <buffer> <C-c> :bdelete<CR>
  nmap <silent> <buffer> q :bdelete<CR>
endfunction

function s:ChooseFile()
  let file = getline(".")
  bdelete
  execute 'edit' fnameescape(file)
endfunction

augroup Yaff
  autocmd BufWinLeave YaffList bdelete
augroup END
