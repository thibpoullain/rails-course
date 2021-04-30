FROM ruby:3.0.1-alpine
LABEL maintainer="thibaut.poullain@ydrazil.fr"

ENV LANG=C.UTF-8

# Add basic packages
RUN apk add --no-cache \
      build-base \
      postgresql-dev \
      git \
      nodejs \
      yarn \
      tzdata \
      file

WORKDIR /app

# Install standard Node modules
COPY package.json yarn.lock /app/
RUN yarn install --frozen-lockfile

# Install standard gems
COPY Gemfile* /app/

RUN bundle lock --add-platform x86_64-linux-musl && \
    bundle config --local frozen 1 && \
    bundle check || bundle install -j4 --retry 3 && \
    bundle clean --force && \
    rm -rf /usr/local/bundle/cache/*.gem && \
    find /usr/local/bundle/gems/ -name "*.c" -delete && \
    find /usr/local/bundle/gems/ -name "*.o" -delete

# Copy the whole application folder into the image
COPY . /app

EXPOSE 3000

CMD bundle exec rails s -b 0.0.0.0

