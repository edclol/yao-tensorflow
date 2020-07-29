FROM tensorflow/tensorflow:2.2.0-gpu

MAINTAINER edclol

USER root

RUN apt update && \
        apt install -y git && \
        rm -rf /var/lib/apt/lists/* && pip3 install requests psutil py-cpuinfo pandas typing hdfs minio imutils opencv-python sklearn

#RUN pip3 install requests psutil py-cpuinfo pandas typing hdfs minio imutils opencv-python sklearn

ADD bootstrap.sh /etc/bootstrap.sh
ADD save.py /etc/save.py

ENTRYPOINT ["/etc/bootstrap.sh"]
