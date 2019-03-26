FROM centos

ARG JMETER_VERSION="5.1"

ENV JMETER_HOME /opt/apache-jmeter-${JMETER_VERSION}
ENV JMETER_BIN  ${JMETER_HOME}/bin
ENV JMETER_DOWNLOAD_URL http://apache.claz.org/jmeter/binaries/apache-jmeter-${JMETER_VERSION}.tgz

USER root

RUN yum -y -q -e 0 install wget java-11-openjdk-devel && \
    yum -y -q clean all && rm -rf /var/cache/yum && \
	mkdir -p /tmp/dependencies && \
	wget ${JMETER_DOWNLOAD_URL} -P /tmp/dependencies  && \
	mkdir -p /opt  && \
	mkdir -p /opt/perf  && \
	tar -xzf /tmp/dependencies/apache-jmeter-${JMETER_VERSION}.tgz -C /opt  && \
	rm -rf /tmp/dependencies

RUN chmod -R g+rw ${JMETER_HOME} && \
	chmod -R g+rw /opt/perf

ENV PATH $PATH:$JMETER_BIN

COPY perftest.jmx /opt/perf/perftest.jmx
COPY starttest.sh /

WORKDIR ${JMETER_HOME}

ENTRYPOINT ["/starttest.sh"]
