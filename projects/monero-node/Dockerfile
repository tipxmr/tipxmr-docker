# Usage: docker run --restart=always -v /var/data/blockchain-xmr:/root/.bitmonero -p 18080:18080 -p 18081:18081 --name=monerod -td kannix/monero-full-node
FROM ubuntu:18.04 AS build

ENV MONERO_VERSION=0.17.1.8 MONERO_SHA256=b566652c5281970c6137c27dd15002fe6d4c9230bc37d81545b2f36c16e7d476

RUN apt-get update && apt-get install -y curl bzip2

WORKDIR /root

RUN curl https://dlsrc.getmonero.org/cli/monero-linux-x64-v$MONERO_VERSION.tar.bz2 -O &&\
  echo "$MONERO_SHA256  monero-linux-x64-v$MONERO_VERSION.tar.bz2" | sha256sum -c - &&\
  tar -xvf monero-linux-x64-v$MONERO_VERSION.tar.bz2 &&\
  rm monero-linux-x64-v$MONERO_VERSION.tar.bz2 &&\
  cp ./monero-x86_64-linux-gnu-v$MONERO_VERSION/monerod . &&\
  rm -r monero-*

# no more required, use --enable-dns-blocklist insted
#RUN curl https://gui.xmr.pm/files/block.txt > /root/block.txt


FROM ubuntu:18.04

RUN useradd -ms /bin/bash monero && mkdir -p /home/monero/.bitmonero && chown -R monero:monero /home/monero/.bitmonero
USER monero
WORKDIR /home/monero

COPY --chown=monero:monero --from=build /root/monerod /home/monero/monerod
#COPY --chown=monero:monero --from=build /root/block.txt /home/monero/block.txt
#COPY --chown=monero:monero --from=build /root/stagenet.conf /home/monero/stagenet.conf


# blockchain location
VOLUME /home/monero/.bitmonero

EXPOSE 38080 38083


ENTRYPOINT ["./monerod"]
CMD ["--non-interactive", "--config-file=/home/monero/.bitmonero/stagenet.conf"]