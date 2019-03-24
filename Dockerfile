FROM ubuntu

RUN apt update && apt install -y wget gnupg lsb-release \
 && export CLOUD_SDK_REPO="cloud-sdk-$(lsb_release -c -s)" \
 && echo "deb http://packages.cloud.google.com/apt $CLOUD_SDK_REPO main" | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
RUN wget -O key https://packages.cloud.google.com/apt/doc/apt-key.gpg && apt-key add key && rm key
RUN apt update && apt -y install google-cloud-sdk kubectl

