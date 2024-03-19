FROM ruby:3 as vvh-dev

RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    git \
    && rm -rf /var/lib/apt/lists/*

RUN gem update --system && gem install bundler && gem install rouge -v 4.2.0 && gem install jekyll

EXPOSE 4000

WORKDIR /src

CMD [ "bundle", "exec", "jekyll", "serve", "--force_polling", "--incremental", "-H", "0.0.0.0", "-P", "4000" ]
