# dot.vim.2nd
vim env 2nd version.

# setup procedure

run `dein.vim` Quick start procedure.
  https://github.com/Shougo/dein.vim

```
$ curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
$ sh ./installer.sh $(pwd)
$ vim -c 'qall!'
$ cd repos/github.com/Shougo/vimproc.vim
$ make
$ cd ~/.vim/.cache/.vimrc/.dein/lib
$ ln -s ../../../../repos/github.com/Shougo/vimproc.vim/lib/vimproc_linux64.so
```
