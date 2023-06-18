FROM debian:bullseye AS builder

LABEL maintainer="RamuneRemonedo <tsuji.riya@gmail.com>"

RUN apt update && apt-get install jq wget -y

ADD ./download-paper.sh ./
RUN chmod +x ./download-paper.sh && ./download-paper.sh

FROM openjdk:20

ENV XMS="1G" \
    XMX="2G" \
    FLAGS="-XX:+UseG1GC -XX:+ParallelRefProcEnabled -XX:MaxGCPauseMillis=200 -XX:+UnlockExperimentalVMOptions -XX:+DisableExplicitGC -XX:+AlwaysPreTouch -XX:G1NewSizePercent=30 -XX:G1MaxNewSizePercent=40 -XX:G1HeapRegionSize=8M -XX:G1ReservePercent=20 -XX:G1HeapWastePercent=5 -XX:G1MixedGCCountTarget=4 -XX:InitiatingHeapOccupancyPercent=15 -XX:G1MixedGCLiveThresholdPercent=90 -XX:G1RSetUpdatingPauseTimePercent=5 -XX:SurvivorRatio=32 -XX:+PerfDisableSharedMem -XX:MaxTenuringThreshold=1 -Dusing.aikars.flags=https://mcflags.emc.gs -Daikars.new.flags=true"

WORKDIR /data
VOLUME /data

COPY --from=builder paper.jar /

ENTRYPOINT java -Xms${XMS} -Xmx${XMX} ${FLAGS} -Dcom.mojang.eula.agree=true -jar /paper.jar