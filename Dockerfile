#################################################
# Dockerfile to build a GitHub Pages Jekyll site
# 
# Base Image: Ubuntu 22.04
# Ruby Version: 3.1.2
# Jekyll Version: 4.3.3
# GitHub Pages: 288
#################################################

# Set the base image to Ubuntu 22.04
FROM ubuntu:22.04

# Update APT package lists to get the latest versions
RUN apt-get update

# Install Ubuntu prerequisites for Ruby and GitHub Pages (Jekyll)
RUN apt-get -y install git \
  curl \
  autoconf \
  bison \
  build-essential \
  libssl-dev \
  libyaml-dev \
  libreadline6-dev \
  zlib1g-dev \
  libncurses5-dev \
  libffi-dev \
  libgdbm6 \
  libgdbm-dev \
  libdb-dev \
  apt-utils

# Set up environment variables for rbenv and Ruby
# Using Ruby 3.1.2 as of this writing
ENV RBENV_ROOT /usr/local/src/rbenv
ENV RUBY_VERSION 3.1.2
ENV PATH ${RBENV_ROOT}/bin:${RBENV_ROOT}/shims:$PATH

# Install rbenv to manage Ruby versions
RUN git clone https://github.com/rbenv/rbenv.git ${RBENV_ROOT} \
  && git clone https://github.com/rbenv/ruby-build.git ${RBENV_ROOT}/plugins/ruby-build \
  && ${RBENV_ROOT}/plugins/ruby-build/install.sh \
  && echo 'eval "$(rbenv init -)"' >> /etc/profile.d/rbenv.sh

# Install the specified Ruby version and set it as global
RUN rbenv install ${RUBY_VERSION} \
  && rbenv global ${RUBY_VERSION}

# Install the GitHub Pages-supported version of Jekyll
RUN gem install jekyll -v '4.2.2'
