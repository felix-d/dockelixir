# Distillery release
FROM bitwalker/alpine-elixir as distillery

COPY . /app

WORKDIR /app

ENV MIX_ENV prod
RUN sed -n 's/ *app: :\([a-z_]*\),/\1/p' mix.exs > APP_NAME
RUN sed -n 's/ *version: "\([0-9\.]*\)",/\1/p' mix.exs > APP_VERSION

RUN mix deps.get && mix release
RUN mkdir target
RUN APP_VERSION=$(cat APP_VERSION) APP_NAME=$(cat APP_NAME) \
  sh -c 'tar xzf ./_build/prod/rel/$APP_NAME/releases/$APP_VERSION/$APP_NAME.tar.gz -C ./target'

# Final image
FROM alpine:latest

ENV APP_SECRET=secret REPLACE_OS_VARS=1 PORT=4000 SNAME=web ERLANG_COOKIE=secret

RUN apk add --update openssl bash && \
    rm -rf /var/cache/apk/*

COPY bin/start app/start
COPY rel/vm.args /app
COPY --from=distillery /app/target /app
COPY --from=distillery /app/APP_NAME /app

WORKDIR /app

CMD ["sh", "start"]
