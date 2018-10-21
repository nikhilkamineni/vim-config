## Installation Instructions
1. Remove existing config:

    ```rm -rf ~/.vim```

1. Install configuration:

    ```git clone https://github.com/nikhilkamineni/vim-config.git ~/.vim```


1. Create symlinks:
    Delete original `.vimrc` config file located in home folder and then symlink the vimrc file in `~/.vim/` with the following command:

    ```ln -s ~/.vim/vimrc ~/.vimrc```


1. Install minpac:

    ```git clone https://github.com/k-takata/minpac.git ~/.vim/pack/minpac/opt/minpac```


1. Create `backup`, `swap`, and `undo` `folders` in .vim

    ```mkdir ~/.vim/backup ~/.vim/swap ~/.vim/undo```


1. Enable italics in iTerm:
    
    https://alexpearce.me/2014/05/italics-in-iterm2-vim-tmux/


1. Install plugins using minpac:

    Open vim and run `:PackUpdate`

