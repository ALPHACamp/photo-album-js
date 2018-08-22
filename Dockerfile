FROM ruby:2.4.4

MAINTAINER ihower <ihower@gmail.com>

WORKDIR /tmp
ADD Gemfile* ./

RUN apt-get update && \
    apt-get install -y build-essential libsqlite3-dev nodejs && \
    bundle install

ENV LC_ALL C.UTF-8
ENV TZ Asia/Taipei
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

ENV RAILS_SERVE_STATIC_FILES true

# openssl rand -hex 64
ENV SECRET_KEY_BASE d46c18cca12b5cb021785926eb867cdd007982d8d88f623c18fdb203236b78922119039ce05a4e27e86bafd418251e9c5be71279b9fb5779b0646facdd6e57cc

ENV APP_HOME /app
COPY . $APP_HOME
WORKDIR $APP_HOME

ENV RAILS_ENV=production \
    RACK_ENV=production

# RUN bundle exec rake db:setup
RUN bundle exec rake assets:precompile

EXPOSE 3000

ENTRYPOINT ["bundle", "exec", "puma", "-C", "config/puma.rb"]

## Local build & run & debug

# docker build . -t photo-app
# docker run -v $(pwd)/photo-album.sqlite3:/app/db/production.sqlite3 -p 4001:3000 photo-app

# docker exec -it <CONTAINER ID> bash

## Production build & Deploy

# docker build . -t photo-app
# cd ..
# docker save photo-app -o photo-app.tar
# scp photo-app.tar acio:~/
# ssh acio
# docker load --input photo-app.tar
# docker ps
# docker container stop <CONTAINER ID>
# docker run -v /home/deploy/db/photo-album.sqlite3:/app/db/production.sqlite3 -p 4001:3000 -d --restart always photo-app

