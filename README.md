# Docker Compose local HTTPS

> Examples of local HTTPS with docker-compose + mkcert

## Prerequisites

- [mkcert](https://github.com/FiloSottile/mkcert)
- [Docker Desktop](https://www.docker.com/products/docker-desktop)

Run `mkcert -install`

Run `./init.sh` (creates local certificates using mkcert and copies them to where the Caddy and nginx examples expect them)

## The setup

Each example has a barebones Node app running on the official Node 10 Docker image running on port 8080.

The Node code is at [./caddy/app/index.js](./caddy/app/index.js) and [./nginx/app/index.js](./caddy/app/index.js).

It also has a reverse-proxy set up using Caddy and nginx respectively which

## Caddy Example with Caddyfile

> Caddy is the HTTP/2 web server with automatic HTTPS.
> 
> https://caddyserver.com/

See [./caddy](./caddy), uses [https://github.com/abiosoft/caddy-docker](https://github.com/abiosoft/caddy-docker) Docker image.

To run it:

```sh
cd caddy
docker-compose up
```

Then either nagivate to https://foo.test or `curl https://foo.test`.

> Note: the nginx example needs to be stopped before starting the Caddy example

## Caddy example with docker-gen

> Caddy is the HTTP/2 web server with automatic HTTPS.
> 
> https://caddyserver.com/

This image leverages [Docker-gen](https://github.com/jwilder/docker-gen) to "Generate files from docker container meta-data".

Which allows us to build the configuration for the reverse proxy using labels on the target container (without a Caddyfile, that's the file generated from the labels).

See [./caddy-gen](./caddy-gen), uses [https://github.com/abiosoft/caddy-docker](https://github.com/wemake-services/caddy-gen) Docker image.

## nginx Example

> [nginx](https://www.nginx.com/) is a web server which can also be used as a reverse proxy, load balancer, mail proxy and HTTP cache.
> 
> Wikipedia

See [./nginx](./nginx), uses [https://github.com/jwilder/nginx-proxy](https://github.com/jwilder/nginx-proxy) Docker image.

```sh
cd nginx
docker-compose up
```

Then either nagivate to https://foo.test or `curl https://foo.test`.

> Note: the Caddy example needs to be stopped before starting the nginx example
