ARG RUBY_VERSION=2.6.6

FROM ruby:${RUBY_VERSION}-slim-buster

WORKDIR /app

COPY Gemfile* ./

COPY package.json ./

COPY yarn.lock ./

RUN apt-get update && \
    apt-get install build-essential -y --no-install-recommends \
    vim \
    gnupg2 \
    curl \
    wget \
    nodejs \
    patch \
    ruby-dev \
    zlib1g-dev \
    liblzma-dev \
    libmariadb-dev

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
    apt-get update && apt-get install yarn --no-install-recommends -y

ARG BUNDLER_VERSION=2.1.4

RUN gem install bundler:${BUNDLER_VERSION}

RUN bundle install

RUN bundle exec rails db:prepare

RUN yarn install --check-files

COPY docker/app/*.sh /scripts/

RUN chmod a+x /scripts/*.sh
