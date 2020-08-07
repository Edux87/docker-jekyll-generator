FROM ruby:2.4
LABEL AUTHOR edaniel15@gmail.com
ENV TERM xterm

RUN mkdir -p /src/site
WORKDIR /src

RUN gem install jekyll -v '4.1.1'
RUN gem install bundler
RUN gem install nokogiri
RUN gem install public_suffix --version 3.0.2
RUN gem install rouge --version 3.1.1
RUN gem install execjs
RUN gem install tzinfo-data
RUN gem install --platform x64-mingw32 wdm
RUN jekyll --version

COPY ./Gemfile /src
RUN cd /src && bundler install

ENV JEKYLL_ENV development

RUN apt-get update
RUN apt-get install -y nodejs bash

# Set default locale for the environment
ENV LC_ALL C.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8

EXPOSE 4000
EXPOSE 35729

COPY ./main.sh /src
ENTRYPOINT ["sh", "main.sh"]
