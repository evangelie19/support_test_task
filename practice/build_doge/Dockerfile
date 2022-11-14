FROM ubuntu:latest

#deps
RUN apt-get update \
 && apt-get install -y build-essential libtool autotools-dev automake pkg-config libssl-dev libevent-dev bsdmainutils git
RUN apt-get install -y libboost-system-dev libboost-filesystem-dev libboost-chrono-dev libboost-program-options-dev libboost-test-dev libboost-thread-dev

#prepare
RUN mkdir -p /app/src
RUN mkdir -p /app/bin
WORKDIR /app/build
RUN git -C ../src clone https://github.com/dogecoin/dogecoin.git

#build
RUN ../src/dogecoin/autogen.sh .
RUN ../src/dogecoin/configure --disable-wallet --bindir=/app/bin
RUN make clean
RUN make 
RUN make install

ENTRYPOINT ["/app/bin/dogecoind"]
