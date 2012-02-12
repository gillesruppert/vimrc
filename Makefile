all:
	@PWD=$(pwd)
	@echo "Backing up existing .vimrc and .vim to $(HOME)/.vim[rc].bak"
	# conditional backup is not working yet. Need to figure out how to check for the 
	# existence of a file.
	#
	# In the meantime, we just back up regardless. If there is no file,  the script will bomb,
	# but that is preferable to overwriting a users vim files...
	#ifeq exists $(shell if [ -e /Users/gillesruppert/.vimrc ]; then echo "exists"; fi)
	#echo "the file exists"
	#endif
	mv $(HOME)/.vimrc $(HOME)/.vimrc.bak
	mv $(HOME)/.vim $(HOME)/.vim.bak

	@echo "Linking up new .vimrc and .vim"
	ln -s ${PWD}/vimrc $(HOME)/.vimrc
	ln -s ${PWD} $(HOME)/.vim
	@echo "All done. vim..."
