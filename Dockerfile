FROM amidos/dcind:latest

RUN source /docker-lib.sh

RUN apk add ruby-dev make gcc libc-dev ruby-full --no-cache
RUN rm -rf /var/cache/apk/*
RUN gem install bundler rake --no-rdoc --no-ri

COPY Gemfile Gemfile
RUN bundle
