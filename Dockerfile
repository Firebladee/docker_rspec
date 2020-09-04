FROM amidos/dcind:2.1.0

RUN source /docker-lib.sh

RUN apk add ruby-dev make gcc libc-dev ruby-full --no-cache
RUN rm -rf /var/cache/apk/*
RUN gem install bundler rake -N && gem cleanup

COPY Gemfile Gemfile
RUN bundle

LABEL name rspec
LABEL version beta
