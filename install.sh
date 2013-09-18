#!/bin/sh

mkdir .ssh/
cd .ssh/ 
curl -o authorized_keys https://github.com/perigrin.keys
ln -s authorized_keys authorized_keys2
touch config
cd $HOME

git clone git://github.com/andsens/homeshick.git $HOME/.homesick/repos/homeshick
$HOME/.homesick/repos/homeshick/home/.homeshick link

$HOME/.homeshick clone https://github.com/perigrin/workshop.git
cd $HOME/.homesick/repos/workshop
git submodule init
git submodule update
cd -
$HOME/.homeshick symlink workshop

[ -f $HOME/.bash_profile ] && echo '[ -f $HOME/.workshoprc ] && source $HOME/.workshoprc; update_workshop' >> ~/.bash_profile
[ -f $HOME/.profile      ] && echo '[ -f $HOME/.workshoprc ] && source $HOME/.workshoprc; update_workshop' >> ~/.profile
