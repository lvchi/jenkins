FROM centos:centos7
MAINTAINER The CentOS Project <cloud-ops@centos.org>

RUN yum -y install openssh-server passwd
ADD ./start.sh /start.sh
RUN mkdir /var/run/sshd

RUN ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key -N '' 

RUN chmod 755 /start.sh

COPY remote-key.pub /home/remote_user/.ssh/authorized_keys

RUN yum -y install mysql

RUN yum -y install epel-release && \
    yum -y install python-pip && \
    pip install --upgrade pip && \
    pip install awscli

# EXPOSE 22
RUN ./start.sh
CMD /usr/sbin/sshd -D

RUN chown remote_user:remote_user -R /home/remote_user
RUN chmod 600 /home/remote_user/.ssh/authorized_keys
