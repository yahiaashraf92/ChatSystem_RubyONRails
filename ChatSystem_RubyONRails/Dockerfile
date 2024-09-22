FROM ruby:3.3.4-slim

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs libmariadb-dev

RUN mkdir /app
WORKDIR /app 

ADD Gemfile /app/Gemfile
ADD Gemfile.lock /app/Gemfile.lock
RUN bundle install

ADD . /app

CMD ["bundle", "exec", "rails", "s", "-p", "3000", "-b", "0.0.0.0"]
