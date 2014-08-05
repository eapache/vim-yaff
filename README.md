vim-yaff
========

Yet Another Fuzzy Finder for Vim

YAFF is yet another fuzzy-file finder plugin for Vim. Previous entries in this
category include:
 - [Ctrl-P](https://github.com/kien/ctrlp.vim)
 - [Unite](https://github.com/Shougo/unite.vim)
 - [Command-T](https://github.com/wincent/Command-T)

What differentiates YAFF is that it's *super*-simple and thus super-fast. It's
pure vimscript, it doesn't have its own matching logic or complex caching or
anything like that. It just creates a split, fills it with the list of files in
the current directory, and drops you into vim's search mode automatically.

This is mapped to ctrl-P by default - try and guess which one of the above list
I was using previously ;)
