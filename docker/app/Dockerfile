ARG RUBY_VERSION=2.7.1

FROM ruby:${RUBY_VERSION}-slim-buster

ARG USERID

ARG GROUPID

ARG APP_PATH=/app

ARG BUNDLER_VERSION=2.1.4

WORKDIR ${APP_PATH}

COPY Gemfile* ./

COPY package.json ./

COPY yarn.lock ./

RUN apt-get update && \
    apt-get install build-essential -y --no-install-recommends \
    vim \
    git \
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
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | \
    tee /etc/apt/sources.list.d/yarn.list && \
    apt-get update && apt-get install yarn --no-install-recommends -y

RUN rm -rf /var/lib/apt/lists/*

ENV BUNDLER_PATH=/bundle BUNDLE_BIN=/bundle/bin GEM_HOME=/bundle

ENV PATH="${BUNDLE_BIN}:${PATH}"

RUN gem install bundler:${BUNDLER_VERSION}

COPY docker/app/*.sh /scripts/

RUN chmod a+x /scripts/*.sh

RUN useradd -m docker --uid=${USERID}

USER ${USERID}:${GROUPID}

CMD /scripts/command.sh
