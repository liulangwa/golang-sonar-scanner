# Pull base image.
FROM golang:latest

# Install OpenJDK 8 && sonarqube scannner
RUN \
    apt-get update && \
    apt-get -yqq --no-install-recommends install bzip2 curl unzip && \
    apt-get install -y  openjdk-8-jre-headless ca-certificates-java && \
    apt-get -yqq autoremove && \
    apt-get -yqq clean && \
    rm -rf /var/lib/apt/lists/* /var/cache/* /tmp/* /var/tmp/* && \
    curl --insecure -OL https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-3.3.0.1492-linux.zip && \
    unzip sonar-scanner-cli-3.3.0.1492-linux.zip  -d /home && \
    rm -f sonar-scanner-cli-3.3.0.1492-linux.zip && \
    ln -s /home/sonar-scanner-3.3.0.1492-linux/bin/sonar-scanner /usr/bin/sonar-scanner