FROM amidos/dcind:2.1.0

RUN source /docker-lib.sh

RUN apk add ruby-dev make gcc libc-dev ruby-full --no-cache && \
    rm -rf /var/cache/apk/* && \
    gem install bundler rake -N && gem cleanup

WORKDIR rspec

COPY Gemfile Gemfile
RUN bundle

LABEL name rspec
LABEL version beta
