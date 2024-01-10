#FROM amidos/dcind:2.1.0
FROM fireblade/dcind

RUN source /docker-lib.sh

WORKDIR /rspec

RUN apk add ruby-dev make gcc libc-dev ruby-full --no-cache && \
    rm -rf /var/cache/apk/* && \
    gem install bundler rake -N && gem cleanup

COPY Gemfile Gemfile
RUN bundle

LABEL name rspec
LABEL version beta
