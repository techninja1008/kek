FROM elixir

RUN mix local.hex --force
RUN mix local.rebar --force

ADD . /app

WORKDIR /app

RUN mix deps.get
RUN mix compile

ENTRYPOINT ["/bin/bash", "-c", "iex -S mix"]