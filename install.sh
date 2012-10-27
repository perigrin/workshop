#!/bin/sh

curl -l https://raw.github.com/andsens/homeshick/master/install.sh | sh
git clone git@github.com:perigrin/workshop.hs.git $HOME/.homesick/repos/workshop
$HOME/.homeshick symlink workshop
