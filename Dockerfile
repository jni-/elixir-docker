FROM base/archlinux:latest

# Basic stuff
RUN pacman -Sy --noconfirm

# Locale
ENV LANG en_US.UTF-8

# Install build stuff
RUN mkdir /tmp/build-elixir && cd /tmp/build-elixir && pacman -S --needed --noconfirm wget erlang-nox libunistring git make binutils && wget https://aur.archlinux.org/packages/el/elixir-git/elixir-git.tar.gz && tar -xvf elixir-git.tar.gz && cd elixir-git && makepkg --asroot && pacman -U --noconfirm elixir*.xz && pacman -Rs --noconfirm git make binutils && pacman -Scc --noconfirm
