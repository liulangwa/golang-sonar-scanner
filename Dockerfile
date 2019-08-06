# Pull base image.
FROM golang:1.12.7-stretch

ENV SONAR_SCANNER_CLI_VERSION 4.0.0.1744


# Install OpenJDK 8 && sonarqube scannner
RUN \
    apt-get update && \
    apt-get -yqq --no-install-recommends install apt-utils  bzip2 curl unzip && \
    apt-get install -y  openjdk-8-jre-headless ca-certificates-java && \
    apt-get -yqq autoremove && \
    apt-get -yqq clean && \
    rm -rf /var/lib/apt/lists/* /var/cache/* /tmp/* /var/tmp/* && \
    curl --insecure -OL https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-${SONAR_SCANNER_CLI_VERSION}-linux.zip  && \
    unzip sonar-scanner-cli-${SONAR_SCANNER_CLI_VERSION}-linux.zip  -d /home && \
    rm -f sonar-scanner-cli-${SONAR_SCANNER_CLI_VERSION}-linux.zip  && \
    ln -s /home/sonar-scanner-${SONAR_SCANNER_CLI_VERSION}-linux/bin/sonar-scanner /usr/bin/sonar-scanner
