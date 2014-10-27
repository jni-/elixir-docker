FROM base/archlinux:latest

# Locale
ENV LANG en_US.UTF-8

# Install build stuff
RUN mkdir /tmp/build-elixir && cd /tmp/build-elixir && pacman -Sy --needed --noconfirm wget erlang-nox libunistring git make binutils phantomjs && wget https://aur.archlinux.org/packages/el/elixir-git/elixir-git.tar.gz && tar -xvf elixir-git.tar.gz && cd elixir-git && makepkg --asroot && pacman -U --noconfirm elixir*.xz && pacman -Scc --noconfirm
