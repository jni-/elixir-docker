FROM base/devel:latest

# Basic stuff
RUN pacman -Sy --noconfirm

# Locale
ENV LANG en_US.UTF-8

# Install build stuff
RUN yaourt -S --needed --noconfirm git elixir-git && pacman -Scc --noconfirm
