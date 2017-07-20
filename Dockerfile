FROM centos/systemd

RUN yum -y install epel-release && \
	yum -y install gcc gcc-c++ make openssl-devel python-devel nginx && \
    curl "https://bootstrap.pypa.io/get-pip.py" -o "/tmp/get-pip.py" && \
	python /tmp/get-pip.py && \
	pip install uwsgi

ENTRYPOINT ["/app/docker_entrypoint"]

CMD ["/usr/sbin/init"]