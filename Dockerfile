FROM ruby:alpine
MAINTAINER Edgar Castanheda <edaniel15@gmail.com> (@Edux87)

ENV TERM xterm

RUN mkdir -p /src/site
WORKDIR /src

RUN apk add --update musl-dev bash ca-certificates gcc make linux-headers curl make gcc g++ python paxctl libgcc libstdc++ gnupg
RUN rm /var/cache/apk/*

ADD ./Gemfile /src
RUN gem install bundler

RUN cd /src && bundler install

ENV NODEJS_VERSION=5.6.0 \
    NODEJS_SHA256=3af2cc5e5970afc83e59f2065fea2e2df846a544a100cd3c0527f0db05bec27f \
    NPM_VERSION=3.7.1

RUN info(){ printf '\n--\n%s\n--\n\n' "$*"; } \
    && info "==> Installing dependencies..." \
    && apk update \
    && apk add --virtual build-deps \
      curl make gcc g++ python paxctl \
      musl-dev openssl-dev zlib-dev \
      linux-headers binutils-gold \
    && mkdir -p /root/nodejs \
    && cd /root/nodejs \
    && info "==> Downloading..." \
    && curl -sSL -o node.tar.gz http://nodejs.org/dist/v${NODEJS_VERSION}/node-v${NODEJS_VERSION}.tar.gz \
    && echo "$NODEJS_SHA256  node.tar.gz" > node.sha256 \
    && sha256sum -c node.sha256 \
    && info "==> Extracting..." \
    && tar -xzf node.tar.gz \
    && cd node-* \
    && info "==> Configuring..." \
    && readonly NPROC=$(grep -c ^processor /proc/cpuinfo 2>/dev/null || echo 1) \
    && echo "using upto $NPROC threads" \
    && ./configure \
     --prefix=/usr \
     --shared-openssl \
     --shared-zlib \
    && info "==> Building..." \
    && make -j$NPROC -C out mksnapshot \
    && paxctl -c -m out/Release/mksnapshot \
    && make -j$NPROC \
    && info "==> Installing..." \
    && make install \
    && info "==> Finishing..." \
    && apk del build-deps \
    && apk add \
      openssl libgcc libstdc++ \
    && rm -rf /var/cache/apk/* \
    && info "==> Updating NPM..." \
    && npm i -g npm@$NPM_VERSION \
    && info "==> Cleaning up..." \
    && npm cache clean \
    && rm -rf ~/.node-gyp /tmp/* \
    && rm -rf /root/nodejs \
    && echo 'Done! =)'

ADD ./main.sh /src
ENV JEKYLL_ENV development
EXPOSE 4000
ENTRYPOINT ["sh", "main.sh"]
