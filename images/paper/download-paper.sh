#!/bin/sh

# Fetch URL
URL=https://papermc.io/api/v2/projects/paper
URL=${URL}/versions/${MC_VERSION}
BUILD=$(wget -qO - $URL | jq '.builds[-1]')
JAR_NAME=paper-${MC_VERSION}-${BUILD}.jar
URL=${URL}/builds/${BUILD}/downloads/${JAR_NAME}

# Download waterfall.jar
wget ${URL} -O paper.jar