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

