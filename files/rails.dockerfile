FROM ubuntu:14.04

RUN apt-get -qq update
RUN apt-get -qqy upgrade

RUN RUN DEBIAN_FRONTEND=noninteractive \
  apt-get -qqy install git vim tmux
RUN RUN DEBIAN_FRONTEND=noninteractive \
  apt-get -qqy install ruby1.9.1 ruby1.9.1-dev build-essential libpq-dev libv8-dev libsqlite3-dev
RUN gem install rubygems-update && update_rubygems
RUN gem install bundler
RUN gem install therubyracer

RUN adduser --disabled-password --home=/opt/webapp --gecos "" rails
RUN mkdir /opt/bundler && chown rails -R /opt/bundler

ADD webapp/Gemfile /opt/bundler/Gemfile
ADD webapp/Gemfile.lock /opt/bundler/Gemfile.lock
RUN bundle config path /opt/bundler
RUN su rails -c bundle install

ADD webapp /opt/webapp
RUN chown rails -R /opt/webapp

WORKDIR /opt/webapp
USER rails
EXPOSE 3000
CMD cd /opt/webapp && ./bin/rails server $* -p 3000