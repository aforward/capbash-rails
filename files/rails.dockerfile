FROM ubuntu:14.04

RUN apt-get -qy install git vim tmux
RUN apt-get -qy install ruby1.9.1 ruby1.9.1-dev build-essential libpq-dev libv8-dev libsqlite3-dev
RUN gem install bundler

RUN adduser --disabled-password --home=/opt/webapp --gecos "" rails


ADD webapp /opt/webapp
RUN chown rails -R /opt/webapp

WORKDIR /opt/webapp
RUN bundle config path /opt/bundler

USER rails
RUN bundle install

EXPOSE 3000
CMD cd /opt/webapp && ./bin/rails server $* -p 3000
