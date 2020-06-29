FROM ruby:2.7-alpine
RUN mkdir /code
WORKDIR /code
COPY Gemfile /code/Gemfile
COPY Gemfile.lock /code/Gemfile.lock
RUN bundle install
COPY ./src /code