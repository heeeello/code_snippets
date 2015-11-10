FROM centos7


RUN  yum install -y yum install java-1.8.0-openjdk.x86_64


RUN  echo "export LANG=en_US.UTF-8" >> /root/.bashrc
RUN  echo "export JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-1.8.0.60-2.b27.el7_1.x86_64" >> /root/.bashrc


RUN yum install -y  unzip



RUN curl -s get.sdkman.io | bash

RUN source ~/.bashrc

# We can maually copy grails-3.1.0.M1.zip to /root/.sdkman/archives/
RUN sdk install grails 3.1.0.M1


