FROM ubuntu:16.04

MAINTAINER Damon Prater <damon@inxaos.com>

# Update and installa zip utility
# fix for favorites.json error
RUN apt-get update && apt-get install -y \
    zip \
    apt-get clean && \
    favorites_path="/root/My Games/Terraria" && mkdir -p "$favorites_path" && echo "{}" > "$favorites_path/favorites.json"

# Download and install TShock
ENV TERRARIA_VERSION=1344 \
    TSHOCK_FILE_POSTFIX=""

ADD http://terraria.org/server/terraria-server-$TERRARIA_VERSION.zip
RUN unzip terraria-server-$TERRARIA_VERSION.zip -d /terraria-server && \
    rm terraria-server-$TERRARIA_VERSION.zip && \
    chmod 777 /terraria-server/Dedicated Server/Linux/TerrariaServer.exe.x86_64

# Allow for external data
VOLUME ["/world"]

# Set working directory to server
WORKDIR /terraria-server/Dedicated Server/Linux

# run the server
#ENTRYPOINT ["TerrariaServer.exe", "-autoarch", "-configpath", "/world", "-worldpath", "/world", "-logpath", "/world"]
ENTRYPOINT ["TerrariaServer.exe.x86_64", "-autoarch", "-config", "/world/config.txt"]
