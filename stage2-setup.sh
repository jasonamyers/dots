#!/bin/bash

echo -e "\n>> Installing and Setting Python 2.7.11 to default"
pyenv install 2.7.11
pyenv global 2.7.11

echo -e "\n>> Installing Python 3.5.1"
pyenv install 3.5.1

echo -e "\n>> Installing Node.js 5.3.0"
nvm install v5.3.0

echo -e "\n>> Install NVM"
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.29.0/install.sh | bash

echo -e "\n>> Install Rust"
curl -sSf https://static.rust-lang.org/rustup.sh | sh
git clone https://github.com/rust-lang/rust.git ~/.rust

echo -e "\n>> Installing Rust Racer (AutoCompletion)"
git clone https://github.com/phildawes/racer.git /tmp/racer
cd /tmp/racer
cargo build --release
sudo mv /tmp/racer/target/release/racer /usr/local/bin
cd ~
sudo rm -rf /tmp/racer

echo -e "\n>> Setting up Go"
go get golang.org/x/tools/cmd/goimports
go get golang.org/x/tools/cmd/oracle && sudo mv $GOPATH/bin/oracle $GOROOT/bin/

echo -e "\n>> Open emacs, it will compile for a while and end in an error about go auto loads
25. Run M-x update-file-autoloads, Use '~/Misc/emacs/go-mode.el/go-mode.el' as the first answer, and '~/Misc/emacs/go-mode.el/go-mode-load.el' as the autoloads files"
