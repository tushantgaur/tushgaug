FROM centos:7

MAINTAINER gaurav jain <gjain13.com>

RUN yum update -y
RUN yum install -y wget
RUN yum install -y java
RUN yum clean all

RUN mkdir /home/jmeter
RUN cd /home/jmeter/

RUN wget http://apache-mirror.rbc.ru/pub/apache/jmeter/binaries/apache-jmeter-3.0.tgz

RUN tar -xzf apache-jmeter-3.0.tgz
RUN rm -rf apache-jmeter-3.0.tgz

ADD STC.jmx /home/jmeter/STC.jmx

EXPOSE 1099

CMD /apache-jmeter-3.0/bin/jmeter.sh -n -t /home/jmeter/STC.jmx -l /home/jmeter/STC_Result.jtl -JTEST_DURATION=$TEST_DURATION -JREPORT_DIR_PATH=./reports/ -q /home/jmeter/apache-jmeter-3.0/bin/jmeter.properties
