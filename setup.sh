#!/bin/bash

echo -e "\n>> Installing liquidprompt"
git clone https://github.com/nojhan/liquidprompt.git ~/liquidprompt

# Init symlinks for config files
echo -e "\n>> Creating symlinks"
for file in [a-zA-Z]* ; do
    if [[ "$file" != "setup.sh" && "$file" != "README.md" && "$file" != "env" && "$file" != "LICENSE.txt" ]] ; then
        if [[ -h ~/."$file" ]] ; then
            # symlink, remove it since it will be re-created anyway
            echo "  Removing symbolic link ~/.$file"
            rm ~/."$file"
        elif [[ -a ~/."$file" ]] ; then
            # an actual file, create backup
            echo "  ~/.$file exists. Moving it to ~/.$file.backup"
            mv ~/."$file" ~/."$file".backup || echo "  Couldn't move ~/.$file to ~/.$file.backup!"
        fi

        ln -s `pwd`/"$file" ~/."$file" && echo "  Linked ~/.$file to `pwd`/$file" || echo "  Couldn't link ~/.$file to `pwd`/$file!"
    fi
done

echo -e "\n>> Setting up Vundle"
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

echo -e "\n>> Installing VIM Plugins"
vim +PluginInstall +qall

echo -e "\n>> Installing Jedi"
cd ~/.vim/bundle/jedi-vim
git submodule init
git submodule update

cd ~

echo -e "\n>> Cloning Emacs Config"
git clone git@github.com:jasonamyers/prelude ~/.emacs.d
mkdir -p ~/Misc/emacs && cd ~/Misc/emacs
git clone git@github.com:dominikh/go-mode.el.git
cd ~

echo -e "\n>> Install Pyenv"
curl -L https://raw.githubusercontent.com/yyuu/pyenv-installer/master/bin/pyenv-installer | bash
git clone https://github.com/yyuu/pyenv-virtualenvwrapper.git ~/.pyenv/plugins/pyenv-virtualenvwrapper

echo -e "\n>> Initializing Fonts"
fc-cache

echo -e "\n>> Manually download the lastest version of Go from https://golang.org/dl/"
echo -e "\n>> Install Go: sudo tar -C /usr/local -xzf ~/Downloads/go1.5.2.linux-amd64.tar.gz"

echo -e "\n>> Start a new terminal window and run stage2-setup.sh"
