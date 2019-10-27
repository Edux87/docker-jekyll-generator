FROM ruby:2.4
MAINTAINER Edgar Castanheda <edaniel15@gmail.com> (@Edux87)
ENV TERM xterm

RUN mkdir -p /src/site
WORKDIR /src

RUN gem install jekyll -v '4.0.0'
RUN gem install bundler
RUN gem install nokogiri
RUN gem install public_suffix --version 3.0.2
RUN gem install rouge --version 3.1.1
RUN gem install execjs
RUN jekyll --version

COPY ./Gemfile /src
RUN cd /src && bundler install

COPY ./main.sh /src
ENV JEKYLL_ENV development

RUN apt-get update
RUN apt-get install -y nodejs

# Set default locale for the environment
ENV LC_ALL C.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8

EXPOSE 4000
ENTRYPOINT ["sh", "main.sh"]
