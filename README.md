# terraria-docker-home-server
Dockerfile based terraria server for home use, in the future it may be automated with docker-compose

## Docker image

* Based on `debian:11-slim`
* Non-root user
* Has nothing installed but the server in `/server`
* Follows [hadolint][1] and [shellcheck][2] rules with some exceptions (see `.hadolint.yaml`)

## Usage

* Create the image (pre-generated image will someday in the future be created and posted here)
* Run the server as you want

## What's in the pipeline

* `bootstrap.sh` script which starts up the server with user defined parameters and shuts it down gracefully
* Modify the docker image so the entry point is the `bootstrap.sh` script
* Docker-compose support / how-to-guide so it can be automatically deployed and configured

[1]: https://github.com/hadolint/hadolint
[2]: https://github.com/koalaman/shellcheck