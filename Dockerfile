FROM ruby:3.2-slim

RUN apt-get update -qq && \
    apt-get install -y --no-install-recommends \
      build-essential \
      libpq-dev \
      libyaml-dev \
      curl \
      git \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY Gemfile ./
RUN bundle install --jobs 4 --retry 3

COPY . .

RUN mkdir -p log tmp/pids tmp/cache tmp/sockets public/assets

EXPOSE 3000

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]

CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0", "-p", "3000"]
