#!/bin/bash

set -e

# set time zone
ln -s /usr/share/zoneinfo/UTC /etc/localtime

# set locale
echo 'en_US.UTF-8 UTF-8' > /etc/locale.gen
locale-gen
echo 'LANG=en_US.UTF-8' > /etc/locale.conf

# install packages
pacman -Syu --noconfirm --needed                       \
    base                                               \
    base-devel                                         \
    poppler                                            \
    imagemagick                                        \
    wget                                               \
    xz                                                 \
    pandoc                                             \
    git                                                \
    lazygit                                            \
    bat                                                \
    rsync                                              \
    parallel                                           \
    vim                                                \
    nnn                                                \
    tmux                                               \
    gcc-fortran                                        \
    openblas                                           \
    r

# gsl
pacman -Syu --noconfirm --needed                       \
    gsl
    
# nloptr
pacman -Syu --noconfirm --needed                       \
    cmake

# misc3d
pacman -Syu --noconfirm --needed                       \
    tcl                                                \
    tk
