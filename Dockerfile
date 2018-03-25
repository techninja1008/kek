FROM elixir

ADD . /app

WORKDIR /app

RUN mix deps.get

ENTRYPOINT ["/bin/bash", "-c", "mix"]