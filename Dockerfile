FROM debian:jessie
MAINTAINER yaasita

#apt
RUN apt-get update
RUN apt-get upgrade -y

#package
RUN apt-get install -y vim \
 aptitude squirrelmail-locales squirrelmail apache2 htop w3m

#ssh
RUN apt-get install -y openssh-server
RUN mkdir /var/run/sshd/
RUN mkdir /root/.ssh
RUN perl -i -ple 's/^(permitrootlogin\s)(.*)/\1yes/i' /etc/ssh/sshd_config
RUN echo root:root | chpasswd

# supervisor
RUN apt-get install -y supervisor
ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf
EXPOSE 22 80
CMD ["/usr/bin/supervisord"]

# squirrelmail
RUN ln -s /etc/squirrelmail/apache.conf /etc/apache2/conf-enabled/squirrelmail.conf

