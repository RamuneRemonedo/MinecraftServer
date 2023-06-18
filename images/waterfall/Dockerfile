FROM debian:bullseye AS builder

LABEL maintainer="RamuneRemonedo <tsuji.riya@gmail.com>"

RUN apt update && apt-get install jq wget -y

ADD ./download-waterfall.sh ./
RUN chmod +x ./download-waterfall.sh && ./download-waterfall.sh

FROM openjdk:20

ENV XMS="1G" \
    XMX="1G" \
    FLAGS="-XX:+UseG1GC -XX:G1HeapRegionSize=4M -XX:+UnlockExperimentalVMOptions -XX:+ParallelRefProcEnabled -XX:+AlwaysPreTouch"


WORKDIR /data
VOLUME /data

COPY --from=builder waterfall.jar /

ENTRYPOINT java -Xms${XMS} -Xmx${XMX} ${FLAGS} -jar /waterfall.jar