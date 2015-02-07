let s:files = []

function yaff#ListFiles()
  new YaffList
  setlocal buftype=nofile
  setlocal bufhidden=hide
  setlocal noswapfile

  if len(s:files) == 0
    let s:files = split(globpath('.', '**'), '\n')
  endif
  call setline(1, s:files)
  call cursor(1, 1)
  call feedkeys("/\\V")

  setlocal nomodifiable
  nnoremap <silent> <buffer> <CR> :call <SID>ChooseFile()<CR>
  nnoremap <silent> <buffer> <Esc> :bdelete<CR>
  nnoremap <silent> <buffer> <C-c> :bdelete<CR>
  nnoremap <silent> <buffer> q :bdelete<CR>
endfunction

function s:ChooseFile()
  let file = fnameescape(getline("."))
  bdelete
  execute 'edit' file
endfunction

augroup Yaff
  autocmd BufWinLeave YaffList bdelete
augroup END
