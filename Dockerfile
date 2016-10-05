FROM gluster/gluster-centos

RUN yum install -y epel-release

RUN INSTALL_PKGS="bash tar jq" && \
    yum install -y $INSTALL_PKGS && \
    rpm -V $INSTALL_PKGS && \
yum clean all

#ADD jq-linux64 /usr/bin/jq
ADD recycler.sh /
RUN chmod +x recycler.sh
USER 1001
CMD /recycler.sh
