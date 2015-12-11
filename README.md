## Vim-Pastery ##
Just a plugin for [Pastery](https://www.pastery.net/).
Inspired by [vim-gist](https://github.com/mattn/gist-vim).

This is the working version.

```
# Developed and tested on:
Vim 7.4
```

## Getting started

Add to [Plug](https://github.com/junegunn/vim-plug) package manager or any other:

```vim
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes
Plug 'mattn/webapi-vim'
Plug 'fishbullet/vim-pastery'

call plug#end()
```

## Set api key

To write api key for post a snippet to own account run command in vim:

```vim
:PasteryApiKey
```

## Post snippet

You able to post the snippet without an api key, with a command below:

```vim
:PasteryPost
```
Check your vim `cmdline` for url of the snippet!

## Setup

Add to your `~/.vimrc`:

```vim
nnoremap <leader>pas :PasteryPost<cr>
```

## Help

Check out the vim help:

```vim
:h vim-pastery
```

## Contributing

Feel free to send a pull request :stuck_out_tongue_closed_eyes:!

## TODO

* open snippet in browser after upload
* pull snippets list
* use filename as snippet name



