FROM ruby:3.0.1-alpine
LABEL maintainer="thibaut.poullain@ydrazil.fr"

ENV LANG=C.UTF-8

RUN apk add --no-cache \
      build-base \
      postgresql-dev \
      git \
      nodejs \
      yarn \
      tzdata

WORKDIR /app

COPY package.json yarn.lock /app/
RUN yarn install --frozen-lockfile

COPY Gemfile* /app/
RUN gem install bundler -v '~> 2.2.15' && \
    bundle config build.nokogiri --use-system-libraries && \
    bundle lock --add-platform x86_64-linux-musl && \
    bundle config unset frozen && \
    bundle check || bundle install -j4 --retry 3 && \
    bundle clean --force && \
    rm -rf /usr/local/bundle/cache/*.gem && \
    find /usr/local/bundle/gems/ -name "*.c" -delete && \
    find /usr/local/bundle/gems/ -name "*.o" -delete

COPY . /app

EXPOSE 3000

CMD bundle exec rails s -b 0.0.0.0

