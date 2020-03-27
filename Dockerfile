FROM ubuntu:trusty
LABEL author="nam nguyen"
LABEL author_email="thanhnam.it@gmail.com"

# Prvent dpkg error
ENV TERM=xterm-256color

# Set mirrors to AU
RUN sed -i "s/http:\/\/archive./http:\/\/au.archive./g" /etc/apt/sources.list

# Install Nodejs app
RUN apt-get update && \
    apt-get install -y curl && \
    curl -sL https://deb.nodesource.com/setup_8.x | sudo bash - && \
    apt-get install -y nodejs

COPY . /app
WORKDIR /app

# Install application dependencies
RUN npm install -g mocha@5.2.0 && \
    npm install 

# Set mocha test runner as entrypoint
ENTRYPOINT [ "mocha" ]