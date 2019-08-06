# Pull base image.
FROM golang:1.12.7-stretch

ENV SONAR_SCANNER_CLI_VERSION sonar-scanner-cli-4.0.0.1744-linux

# Install OpenJDK 8 && sonarqube scannner
RUN \
    apt-get update && \
    apt-get -yqq --no-install-recommends install apt-utils  bzip2 curl unzip && \
    apt-get install -y  openjdk-8-jre-headless ca-certificates-java && \
    apt-get -yqq autoremove && \
    apt-get -yqq clean && \
    rm -rf /var/lib/apt/lists/* /var/cache/* /tmp/* /var/tmp/* && \
    curl --insecure -OL https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/${SONAR_SCANNER_CLI_VERSION}.zip  && \
    unzip ${SONAR_SCANNER_CLI_VERSION}.zip  -d /home && \
    rm -f ${SONAR_SCANNER_CLI_VERSION}.zip  && \
    ln -s /home/${SONAR_SCANNER_CLI_VERSION}/bin/sonar-scanner /usr/bin/sonar-scanner
