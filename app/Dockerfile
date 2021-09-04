FROM node:16

RUN apt-get update && apt-get install -y libcap-dev netcat g++

RUN git clone --depth=10 https://github.com/erdOne/ojdl2.git /ojdl2\
   && cd /ojdl2 && git submodule update --init --recursive

RUN cd /ojdl2 && npm install && npm run build

RUN cd /ojdl2/isolate && make isolate && make install

COPY languages.js /ojdl2/src/common/languages.js

COPY run_server.sh /ojdl2/run_server.sh
RUN chmod +x /ojdl2/run_server.sh

ARG PORTS_HTTP
ARG PORTS_HTTPS
EXPOSE $PORTS_HTTP
EXPOSE $PORTS_HTTPS

ENTRYPOINT ["/ojdl2/run_server.sh"]
