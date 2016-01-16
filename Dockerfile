FROM ruby:2.3.0

RUN apt-get update && \
    apt-get install -y --no-install-recommends nodejs && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

EXPOSE 3000

ENV BUNDLE_PATH /ruby_gems

ADD Gemfile Gemfile
ADD Gemfile.lock Gemfile.lock
RUN bundle install

ADD . /usr/src/app

CMD bin/rails s -b 0.0.0.0
