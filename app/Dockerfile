FROM ubuntu:latest
# Set shell as needs bash to run Gem without errors 
SHELL ["/bin/bash","-c"]
# Apt-get stuff
RUN apt-get update && apt-get -y install \ 
# Ruby and ruby-dev for cucumber
ruby \
ruby-dev \
# make needs low level vm installed 
llvm \
# for test browser
firefox \
# needed for some of the gems below 
make \
# not sure if nodejs/npm are needed anymore
nodejs \
npm \
# Needed for below call to geckodriver
wget \ 
# X virtual framebuffer needed for headless gem
xvfb \
# needed for getting geckodriver 
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
# check if ffi is needed for build now 
RUN gem install ffi 
# All other gems for cucumber and running headless
RUN gem install cucumber 
RUN gem install rspec 
RUN gem install selenium-webdriver
RUN gem install headless
# initialise cuke
WORKDIR /home/cucumber 
RUN cucumber --init
# copy tests
WORKDIR /home/cucumber
# pull all tests from features to docker container
COPY features/*  features/
