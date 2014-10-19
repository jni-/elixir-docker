FROM debian:latest

# Basic stuff
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get -y update

# Locale
RUN apt-get install -y locales
RUN dpkg-reconfigure locales && \
  locale-gen C.UTF-8 && \
  /usr/sbin/update-locale LANG=C.UTF-8
RUN echo 'en_US.UTF-8 UTF-8' >> /etc/locale.gen && \
  locale-gen
ENV LC_ALL C.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8


# Install build stuff
RUN apt-get -y install wget build-essential git

# Install erlang-solutions repo
RUN mkdir -p /tmp/erlang-build
WORKDIR /tmp/erlang-build
RUN wget https://packages.erlang-solutions.com/erlang-solutions_1.0_all.deb
RUN dpkg -i erlang-solutions_1.0_all.deb

# Install Erlang + Elixir
RUN apt-get -y update
RUN apt-get -y install esl-erlang elixir

# Clean up
WORKDIR /
RUN rm -rf /tmp/erlang-build
RUN apt-get clean

# Create default non-root user called docker
RUN useradd -ms /bin/bash docker
USER docker
ENV HOME /home/docker

