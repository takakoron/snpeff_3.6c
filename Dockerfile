FROM centos:7
COPY . /usr/src/myapp
WORKDIR /usr/src/myapp

RUN yum install -y java-1.7.0-openjdk
RUN yum install -y perl 

ADD http://tga.nig.ac.jp/dnapod/download/Reference/snpEff_3.6c.tar.gz snpEff_3.6c.tar.gz
RUN tar xvzf snpEff_3.6c.tar.gz
RUN mv snpEff_3.6c database

CMD [ "bash"]

