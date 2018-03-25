FROM elixir

ADD . /app

WORKDIR /app

ENTRYPOINT ["/bin/bash", "-c", "mix"]