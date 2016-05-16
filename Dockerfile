FROM ruby:2.2

RUN apt-get update \
    && apt-get install -y \
       nodejs \
       postgresql-client \
       python-setuptools python-dev build-essential \
       --no-install-recommends \
    && easy_install supervisor \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

COPY Gemfile /usr/src/app/
COPY Gemfile.lock /usr/src/app/
RUN bundle install --without development test
