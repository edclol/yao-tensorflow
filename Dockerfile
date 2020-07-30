FROM tensorflow/tensorflow:2.2.0-gpu

MAINTAINER edclol

USER root

RUN chmod 777 /tmp && \
        apt update --allow-unauthenticated && \
        apt install -y git && \
        apt install -y vim && \
        apt install -y apt-file && \
        apt install -y busybox && \
        apt install -y libsm6 libxext6 libxrender-dev libxrender1 libfontconfig1 && \
        rm -rf /var/lib/apt/lists/* && \
        pip3 install requests psutil py-cpuinfo pandas typing hdfs minio numpy imutils opencv-python sklearn \
        -i http://pypi.douban.com/simple/ --trusted-host pypi.douban.com

ADD bootstrap.sh /etc/bootstrap.sh
ADD save.py /etc/save.py

ENTRYPOINT ["/etc/bootstrap.sh"]
