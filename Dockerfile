FROM centos:latest

RUN yum -y update && \
    yum -y install wget bzip2 md5

RUN wget --quiet https://repo.continuum.io/archive/Anaconda3-5.0.1-Linux-x86_64.sh
RUN bash Anaconda3-5.0.1-Linux-x86_64.sh -b
ENV workingdir /opt/workingdir
ENV PATH=$PATH:/root/anaconda3/bin
RUN mkdir ${workingdir}
WORKDIR ${workingdir}
ENTRYPOINT jupyter notebook --allow-root --port=8888 --no-browser  --ip=0.0.0.0 --NotebookApp.token=''
