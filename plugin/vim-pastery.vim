com! -nargs=0 -range PasterySetKey call PasteryApi()

function! PasteryApi()
  call pastery#writeApiKey()
endfunction

com! -nargs=0 -range PasteryPost call PasteryPost()

function! PasteryPost()
  call pastery#postSnippet()
  let json = g:pastery_url
  echo json.url
endfunction

