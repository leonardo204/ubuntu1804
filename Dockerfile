# install ubuntu
FROM zerolive7/ubuntu1804:initial 
MAINTAINER zerolive7@gmail.com

# network
RUN service resolvconf restart

# install packages 
RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections
RUN apt -y update \
&& apt -y install sudo git expect wget

# add user
RUN useradd -rm -d /home/zerolive -s /bin/bash -g root -G sudo -u 1000 -p 1 zerolive
RUN echo 'zerolive  ALL=(ALL:ALL) ALL' >> /etc/sudoers
RUN echo 'zerolive  ALL=NOPASSWD: ALL' >> /etc/sudoers
USER zerolive
WORKDIR /home/zerolive

# copy files
COPY ./mySettings/*.tgz /tmp/
COPY ./xcp /tmp/
