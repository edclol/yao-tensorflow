FROM tensorflow/tensorflow:2.3.0-gpu

MAINTAINER edclol

USER root

RUN chmod -R 777 /tmp && \
        apt update && \
        echo "172.16.1.127  master" >> /etc/hosts && \
        echo "172.16.1.200  work01" >> /etc/hosts && \
        echo "172.16.1.179  work02" >> /etc/hosts && \
        apt install -y git busybox apt-file && \
        pip3 install requests psutil py-cpuinfo pandas typing hdfs minio imutils opencv-python sklearn \
        -i http://pypi.douban.com/simple/ --trusted-host pypi.douban.com && \
        rm -rf /var/lib/apt/lists/*

ADD bootstrap.sh /etc/bootstrap.sh
ADD save.py /etc/save.py

ENTRYPOINT ["/etc/bootstrap.sh"]
