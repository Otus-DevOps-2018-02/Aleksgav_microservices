FROM alpine:3.6

ENV APP_HOME /app

WORKDIR $APP_HOME
ADD Gemfile* $APP_HOME/

RUN apk update \
    && apk --no-cache add build-base ruby ruby-dev ruby-bundler \
    && rm -rf /var/cache/apk/* \
    && bundle install \
    && apk del build-base ruby-dev

ADD . $APP_HOME

ENV POST_SERVICE_HOST=post POST_SERVICE_PORT=5000 COMMENT_SERVICE_HOST=comment COMMENT_SERVICE_PORT=9292

CMD ["puma"]
