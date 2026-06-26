FROM ruby:3.2.4 as vvh-dev

RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    git \
    && rm -rf /var/lib/apt/lists/*

RUN gem update --system && gem install bundler:2.5.13 && gem install logger && gem install sass-embedded:1.77.5 && gem install jekyll-include-cache:0.2.1 && gem install jekyll-last-modified-at:1.3.2 && gem install jekyll:4.3.3 


EXPOSE 4000

WORKDIR /src

CMD [ "bundle", "exec", "jekyll", "serve", "--force_polling", "--incremental", "-H", "0.0.0.0", "-P", "4000" ]
