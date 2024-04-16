ARG APP_IMAGE=python:2.7.18-buster
FROM $APP_IMAGE AS base
FROM base as builder

# Install Java 8
RUN mkdir /usr/java
WORKDIR /usr/java
COPY openlogic-openjdk-8u402-b06-linux-x64.tar.gz .
RUN tar -xzvf openlogic-openjdk-8u402-b06-linux-x64.tar.gz

# Configure Java Environment Variables
ENV JAVA_HOME=/usr/java/openlogic-openjdk-8u402-b06-linux-x64
ENV PATH=$JAVA_HOME/bin:$PATH:$HOME/bin

# Install Qark
WORKDIR /
COPY qark.zip qark.zip
RUN unzip qark.zip
WORKDIR /qark
RUN python -m pip install -r requirements.txt
RUN python -m pip install --user qark
RUN python setup.py install

# Install missing packages
RUN apt update
RUN apt install -y lib32stdc++6 lib32z1 zip

# Download android sdk
# COPY commandlinetools-linux-11076708_latest.zip commandlinetools-linux-11076708_latest.zip
# RUN unzip commandlinetools-linux-11076708_latest.zip
# WORKDIR /qark/cmdline-tools/bin
# RUN ./sdkmanager --licenses --sdk_root=/qark/cmdline-tools
# RUN ./sdkmanager --install "platforms;android-21" "sources;android-21" "build-tools;21.1.2"
COPY cmdline-tools.zip cmdline-tools.zip
RUN unzip cmdline-tools.zip

# Create apk directory
RUN mkdir apk
RUN mkdir exploit

COPY start.sh start.sh
RUN chmod +x start.sh

ENTRYPOINT ["./start.sh"]
