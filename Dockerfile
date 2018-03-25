FROM elixir

RUN mix local.hex --force
RUN mix local.rebar --force

ADD . /app

WORKDIR /app

RUN mix deps.get

ENTRYPOINT ["/bin/bash", "-c", "mix"]