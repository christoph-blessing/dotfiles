# docker-dev

[![docker](https://github.com/cblessing24/docker-dev/actions/workflows/docker.yml/badge.svg)](https://github.com/cblessing24/docker-dev/actions/workflows/docker.yml)

Docker image used for software development.

## Usage

1. Create appropriate `.env` file

```
# GPG key for signing commits
GPG_PASSPHRASE=
GPG_KEYGRIP=
GPG_PRIVATE_KEY=

# SSH key used for managing GitHub repos
SSH_PRIVATE_KEY=
SSH_PASSPHRASE=

# GitHub token to authenticate cli
GH_TOKEN=
```

2. Pull image image and create container

```bash
docker run --env-file .env -it cblessing24/python3.8:latest
```
