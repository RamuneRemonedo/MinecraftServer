FROM debian:bullseye

ENV MC_VERSION="1.20.1"\
    XMS="1G" \
    XMX="2G" \
    FLAGS="-XX:+UseG1GC -XX:+ParallelRefProcEnabled -XX:MaxGCPauseMillis=200 -XX:+UnlockExperimentalVMOptions -XX:+DisableExplicitGC -XX:+AlwaysPreTouch -XX:G1NewSizePercent=30 -XX:G1MaxNewSizePercent=40 -XX:G1HeapRegionSize=8M -XX:G1ReservePercent=20 -XX:G1HeapWastePercent=5 -XX:G1MixedGCCountTarget=4 -XX:InitiatingHeapOccupancyPercent=15 -XX:G1MixedGCLiveThresholdPercent=90 -XX:G1RSetUpdatingPauseTimePercent=5 -XX:SurvivorRatio=32 -XX:+PerfDisableSharedMem -XX:MaxTenuringThreshold=1 -Dusing.aikars.flags=https://mcflags.emc.gs -Daikars.new.flags=true"

RUN apt update && apt-get install jq wget openjdk-17-jdk -y

ADD ./download-paper.sh ./
RUN chmod +x ./download-paper.sh && ./download-paper.sh

WORKDIR /data
VOLUME /data

ENTRYPOINT java -Xms${XMS} -Xmx${XMX} ${FLAGS} -Dcom.mojang.eula.agree=true -jar /paper.jar