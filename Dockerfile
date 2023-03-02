FROM ubuntu:jammy

ADD . /cdhit/

RUN apt-get update -y \
    && apt-get install -y --no-install-recommends \
        build-essential \
        zlib1g-dev

WORKDIR /cdhit

RUN make && make install

# Clean up
RUN rm -rf /var/lib/apt/lists/*

CMD ["cd-hit-est"]
