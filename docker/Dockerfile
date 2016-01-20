#=======================================================================================================================
# Docker
#=======================================================================================================================

FROM centos:6.7

RUN rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-6
RUN yum install -y openssh
RUN yum install -y openssh-server
RUN yum install -y openssh-clients
RUN yum install -y sudo

RUN echo root:vagrant | chpasswd

RUN sed -i -e "s/^Defaults\s*requiretty$/#&/" /etc/sudoers
COPY etc/sudoers.d/vagrant /etc/sudoers.d/

RUN sed -i -e "s/^UsePAM\s*yes$/#&/" /etc/ssh/sshd_config

RUN useradd vagrant
RUN echo vagrant:vagrant | chpasswd

RUN mkdir -p /home/vagrant/.ssh
RUN chown vagrant:vagrant /home/vagrant/.ssh
RUN chmod 700 /home/vagrant/.ssh
COPY home/vagrant/.ssh/authorized_keys /home/vagrant/.ssh/
RUN chown vagrant:vagrant /home/vagrant/.ssh/authorized_keys
RUN chmod 600 /home/vagrant/.ssh/authorized_keys

RUN /sbin/service sshd start
RUN /sbin/service sshd stop
EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]
