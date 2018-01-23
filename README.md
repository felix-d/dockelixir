# Dockelixir

:warning: **This is a work in progress.**

This project is an experiment to run a multi-application Elixir cluster on top
of Docker, Docker-Compose and Docker Swarm. Vagrant virtual machines are used to
simulate a production environment. Production containers run on Alpine and are
built using multi-stage Dockerfiles and Distillery to be as lightweight as
possible.

It also provides a development Docker-Compose environment with watchers.

This project is composed of two separate apps:

1. `chat`, a Phoenix application using Phoenix Channels.
2. `chat_backend`, a GenServer holding the state of the chat
   application in memory.

By keeping the stateful concerns on a separate application part of the same
cluster, we can achieve continuous blue-green deployments on stateless applications
with little overhead.

## Run development cluster with watchers.

*TODO*

## Run the production cluster locally

`docker-compose up`

You can access the web app at `http://localhost:4000`.

## Simulate a production environment with Docker Swarm

*TODO*
