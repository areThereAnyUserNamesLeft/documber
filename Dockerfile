FROM ubuntu:latest
# Set shell as needs bash to run Gem 
SHELL ["/bin/bash","-c"]
# Apt-get stuff
RUN apt-get update && apt-get -y install \ 
ruby \
ruby-dev \
llvm \
firefox \
make \
nodejs \
npm \
wget \ 
xvfb \
git
# Dir structure 
RUN mkdir /home/cucumber 
RUN mkdir /home/geckodriver
# get Geckodriver from git
WORKDIR /usr/bin 
RUN wget https://github.com/mozilla/geckodriver/releases/download/v0.15.0/geckodriver-v0.15.0-linux64.tar.gz
RUN tar -xvzf geckodriver*tar.gz geckodriver
RUN chmod +x geckodriver
RUN rm -f geckodriver*tar.gz
# Gems
RUN gem install bundler 
RUN gem install ffi 
RUN gem install cucumber 
RUN gem install rspec 
RUN gem install selenium-webdriver
RUN gem install headless
# initialise cuke
WORKDIR /home/cucumber 
RUN cucumber --init
# copy tests
WORKDIR /home/cucumber
COPY features/*  features/


