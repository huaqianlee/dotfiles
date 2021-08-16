
if exists("did_load_filetypes")
  finish
endif

function! s:CheckCPP()
  if expand('%:t') !~ '\.'
    setfiletype cpp
  endif
endfunction

augroup filetypedetect
  au! BufRead,BufNewFile *.asm      setfiletype masm
  au! BufRead proxy.pac             setfiletype javascript
  au! BufRead */c++/*               call s:CheckCPP()
  au! BufRead */include/*           call s:CheckCPP()
augroup END
