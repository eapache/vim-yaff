let s:recently_used = []
let s:files = []

function yaff#ListFiles()
  new YaffList
  setlocal buftype=nofile
  setlocal bufhidden=hide
  setlocal noswapfile

  if len(s:files) == 0
    let s:files = split(globpath('.', '**'), '\n')
  endif
  call setline(1, s:recently_used)
  call setline(len(s:recently_used) + 1, s:files)
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
  call filter(s:recently_used, 'v:val !=# "' . file . '"')
  call filter(s:files, 'v:val !=# "' . file . '"')
  call add(s:recently_used, file)
  bdelete
  execute 'edit' file
endfunction

augroup Yaff
  autocmd BufWinLeave YaffList bdelete
augroup END
