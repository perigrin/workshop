#!/bin/sh

curl -l https://raw.github.com/andsens/homeshick/master/install.sh | sh
git clone git@github.com:perigrin/workshop.hs.git $HOME/.homesick/repos/workshop
cd $HOME/.homesick/repos/workshop
git submodule init
git submodule update
cd -
$HOME/.homeshick symlink workshop
[ -f $HOME/.bash_profile ] && echo '[ -f $HOME/.workshoprc ] && source $HOME/.workshoprc; update_workshop' >> ~/.bash_profile
[ -f $HOME/.profile      ] && echo '[ -f $HOME/.workshoprc ] && source $HOME/.workshoprc; update_workshop' >> ~/.profile
