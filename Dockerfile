# base image
FROM ubuntu:14.04

RUN echo "root:root" | chpasswd

RUN sed -i s@/archive.ubuntu.com/@/mirrors.aliyun.com/@g /etc/apt/sources.list
RUN apt-get clean
RUN apt-get update
# support i386
RUN dpkg --add-architecture i386
RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y lib32z1 lib32ncurses5 lib32bz2-1.0
RUN apt-get install -y gcc-multilib g++-multilib build-essential
RUN apt-get install -y git-core gnupg bison flex gperf pngcrush bc zip curl lzop
RUN apt-get install -y schedtool libxml2 libxml2-utils xsltproc squashfs-tools
RUN apt-get install -y libesd0-dev libsdl1.2-dev libwxgtk2.8-dev libswitch-perl
RUN apt-get install -y libssl1.0.0 libssl-dev lib32readline-gplv2-dev libncurses5-dev
RUN apt-get install -y mtd-utils uuid-dev texinfo u-boot-tools
RUN locale-gen zh_CN.UTF-8
RUN locale-gen en_US.UTF-8



# jdk setting
RUN mkdir -p /usr/lib/jvm
RUN apt-get install -y software-properties-common
RUN add-apt-repository -y ppa:openjdk-r/ppa
RUN apt-get update

RUN apt-get install -y vim
# java env setting, default jdk1.8
ADD jdk-8u41.tar.gz /usr/lib/jvm
ENV PATH $JAVA_HOME/bin:$PATH
ENV JAVA_HOME /usr/lib/jvm/java-se-8u41-ri

# java env setting, default jdk1.6
# ADD jdk1.6.0_45.tar.gz /usr/lib/jvm
# ENV JAVA_HOME /usr/lib/jvm/jdk1.6.0_45


# java install

# RUN echo "" >> /home/aosp/.bashrc
# RUN echo "# jdk setting" >> /home/aosp/.bashrc
# RUN echo "export JAVA_HOME=$JAVA_HOME" >> /home/aosp/.bashrc
# RUN echo 'export PATH="$JAVA_HOME/bin:$PATH"' >> /home/aosp/.bashrc
# RUN apt-get install -y openjdk-7-jdk
# RUN apt-get install -y openjdk-8-jdk