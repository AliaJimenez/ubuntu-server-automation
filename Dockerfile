FROM ubuntu:22.04

RUN apt-get update && apt-get install -y openssh-server sudo

RUN mkdir /var/run/sshd

RUN useradd -rm -d /home/ansible -s /bin/bash -g root -G sudo -u 1000 ansible
RUN echo 'ansible:ansible' | chpasswd

RUN echo 'ansible ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]