#!/bin/sh

# Fetch URL
URL=https://papermc.io/api/v2/projects/velocity
MC_VERSION=$(wget -qO - $URL | jq -r '.versions[-1]')
URL=${URL}/versions/${MC_VERSION}
BUILD=$(wget -qO - $URL | jq '.builds[-1]')
JAR_NAME=velocity-${MC_VERSION}-${BUILD}.jar
URL=${URL}/builds/${BUILD}/downloads/${JAR_NAME}

# Download velovity.jar
wget ${URL} -O velocity.jar