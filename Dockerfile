FROM ubuntu:16.04

MAINTAINER Damon Prater <damon@inxaos.com>

# Update and installa zip utility
# fix for favorites.json error
RUN apt-get update && \
	apt-get install -y zip && \	
    apt-get clean

# Download and install Terraria
ENV TERRARIA_VERSION=1344

ADD http://terraria.org/server/terraria-server-$TERRARIA_VERSION.zip /
RUN unzip terraria-server-$TERRARIA_VERSION.zip -d /zipContents && \
    rm terraria-server-$TERRARIA_VERSION.zip && \
	mv "/zipContents/Dedicated Server/Linux" /terraria-server && \
    chmod +x /terraria-server/TerrariaServer.bin.x86_64 && \
	echo "{}" > "/terraria-server/favorites.json"

# Allow for external data
VOLUME ["/world"]

# Set working directory to server
#WORKDIR /terraria-server

# run the server
ENTRYPOINT ["/terraria-server/TerrariaServer.bin.x86_64", "-autoarch", "-config", "/world/config.txt"]
