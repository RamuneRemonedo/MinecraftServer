FROM debian:bullseye AS builder

RUN apt update && apt-get install jq wget -y

ADD ./download-velocity.sh ./
RUN chmod +x ./download-velocity.sh && ./download-velocity.sh

FROM openjdk:20

ENV XMS="1G" \
    XMX="1G" \
    FLAGS="-XX:+UseG1GC -XX:G1HeapRegionSize=4M -XX:+UnlockExperimentalVMOptions -XX:+ParallelRefProcEnabled -XX:+AlwaysPreTouch -XX:MaxInlineLevel=15"


WORKDIR /data
VOLUME /data

COPY --from=builder velocity.jar /

ENTRYPOINT java -Xms${XMS} -Xmx${XMX} ${FLAGS} -jar /velocity.jar