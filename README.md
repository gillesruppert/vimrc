This is my current vim config. It changes on a regular basis.

Mainly configured for JavaScript development.

Installation
============
Clone the repo anywhere you want bar ~/.vim, then run:

    make install

This backs up existing .vimrc and .vim to .vimrc.bak and .vim.bak respectively.

Updating
========
To update plugins, run:

   make update

N.B: you need to have `curl` installed. If you don't want to/can't install `curl`, you need to update the `Makefile` to use `wget`
