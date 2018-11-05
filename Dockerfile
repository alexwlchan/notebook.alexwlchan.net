FROM ruby:2.4-alpine3.6

LABEL maintainer "Alex Chan <alex@alexwlchan.net>"
LABEL description "Build image for my programming notebook"

COPY Gemfile .
COPY Gemfile.lock .

COPY install_jekyll.sh .
RUN ./install_jekyll.sh

VOLUME ["/site"]
WORKDIR /site

ENTRYPOINT ["bundle", "exec", "jekyll"]
