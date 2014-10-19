FROM debian:latest

ENV DEBIAN_FRONTEND noninteractive

# Install build stuff
RUN apt-get -y update
RUN apt-get -y install wget build-essential git

# Install erlang-solutions repo
RUN mkdir -o /tmp/erlang-build
WORKDIR /tmp/erlang-build
RUN wget https://packages.erlang-solutions.com/erlang-solutions_1.0_all.deb
RUN dpkg -i erlang-solutions_1.0_all.deb

# Install Erlang + Elixir
RUN apt-get -y update
RUN apt-get -y install elixir

# Clean up
WORKDIR /
RUN rm -rf /tmp/erlang-build
RUN apt-get clean
