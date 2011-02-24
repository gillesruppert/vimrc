" My customisation of the Wombat theme
" these lines are suggested to be at the top of every colorscheme
hi clear
if exists("syntax_on")
	syntax reset
endif

"Load the 'base' colorscheme - the one you want to alter
runtime colors/wombat.vim
"
""Override the name of the base colorscheme with the name of this custom one
let g:colors_name = "my-wombat"

"Clear the colors for any items that you don't like
hi clear Cursor
hi clear NonText
hi clear SpecialKey
hi clear Normal

"Set up your new & improved colors
hi Cursor 		guifg=NONE    guibg=#72A5BD gui=none
" non text is the line ending shown when invisible chars are set to visible
" don't know what else this targets
hi NonText 		guifg=#393939 guibg=#191919 gui=none
" special key is for example invisible chars (when set to visible)
hi SpecialKey	guifg=#393939 guibg=#191919 gui=none
hi Normal 		guifg=#f6f3e8 guibg=#191919 gui=none
