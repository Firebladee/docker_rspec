FROM amidos/dcind

RUN source /docker-lib.sh

RUN apk add ruby-dev make gcc libc-dev ruby-full
RUN gem install bundler rake --no-rdoc --no-ri

COPY Gemfile Gemfile
RUN bundle
