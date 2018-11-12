FROM alpine:3.6

ENV APP_HOME /app

WORKDIR $APP_HOME
ADD Gemfile* $APP_HOME/

RUN apk update \
    && apk --no-cache add build-base ruby ruby-dev ruby-bundler \
    && rm -rf /var/cache/apk/* \
    && bundle install \
    && apk del build-base ruby-dev ruby-bundler

ADD . $APP_HOME

ENV COMMENT_DATABASE_HOST=comment_db COMMENT_DATABASE=comments

CMD ["puma"]
