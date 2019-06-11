FROM elixir:1.8.2

ENV SHELL /bin/bash

ENV MIX_ENV dev
ENV ERL_AFLAGS -kernel shell_history enabled
RUN printf "IEx.configure(colors: [eval_result: [:cyan, :bright]])\n" >> ~/.iex.exs

ENV DEBIAN_FRONTEND noninteractive
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash -
RUN apt-get update && apt-get install -yq \
    inotify-tools \
    less \
    locales \
    mysql-client \
    nodejs

RUN sed -i "s/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/" /etc/locale.gen
RUN locale-gen
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

RUN curl -o /usr/local/bin/diff-so-fancy https://raw.githubusercontent.com/so-fancy/diff-so-fancy/master/third_party/build_fatpack/diff-so-fancy
RUN chmod a+x /usr/local/bin/diff-so-fancy

RUN mkdir ~/.ssh
RUN touch ~/.ssh/known_hosts
RUN ssh-keyscan -H github.com >> ~/.ssh/known_hosts

RUN mix local.rebar --force
RUN mix local.hex --force