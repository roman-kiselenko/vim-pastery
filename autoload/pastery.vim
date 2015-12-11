if !executable('curl')
  echohl ErrorMsg | echomsg 'Pastery: require ''curl'' command' | echohl None
  finish
endif

if globpath(&rtp, 'autoload/webapi/http.vim') ==# ''
  echohl ErrorMsg | echomsg 'Pastery: require ''webapi'', install https://github.com/mattn/webapi-vim' | echohl None
  finish
endif

function! pastery#writeApiKey()
  if !filereadable(expand("~/.pastery")) 
    execute ':e ' . expand('~/.pastery')
    call setline(1, "api_key=")
  else
    execute ':e ' . expand('~/.pastery')
    echohl ErrorMsg | echomsg 'Pastery: file ~/.pastery already exist' | echohl None
  endif
endfunction

function! pastery#setupVariables()
  if filereadable(expand("~/.pastery"))
    let s:pastery_api_key = join(readfile(expand("~/.pastery")), "\n")
  end
  let s:pastery_url = "https://www.pastery.net/api/paste/"
  let s:params_separator = '?'
  if exists("s:pastery_api_key")
    let s:full_url = s:pastery_url . s:params_separator . s:pastery_api_key
  else
    let s:full_url = s:pastery_url
  endif
endfunction

function! pastery#postSnippet()
  call pastery#setupVariables()
  let s:str = 'curl -s -X POST --data @'
  let output = system(s:str . expand("%") . " " . shellescape(s:full_url))
  let g:pastery_url = webapi#json#decode(output)
endfunction



