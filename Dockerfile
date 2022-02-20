FROM debian:11-slim as builder

ARG terraria_version

WORKDIR /server

RUN apt-get update && apt-get install -y wget unzip && \
    wget --progress=dot:mega "https://terraria.org/api/download/pc-dedicated-server/terraria-server-${terraria_version}.zip" && \
    unzip "terraria-server-${terraria_version}.zip" && \
    mv ${terraria_version}/Linux/* . && \
    rm -rf "${terraria_version}" "terraria-server-${terraria_version}.zip" && \
    chmod +x TerrariaServer*

FROM debian:11-slim

RUN useradd -m terrariaMan
USER terrariaMan

COPY --from=builder --chown=terrariaMan /server /server

WORKDIR /server

RUN mkdir world

ENTRYPOINT [ "bash" ]