FROM ubuntu

RUN apt update && apt install -y wget gnupg lsb-release \
 && export CLOUD_SDK_REPO="cloud-sdk-$(lsb_release -c -s)" \
 && echo "deb http://packages.cloud.google.com/apt $CLOUD_SDK_REPO main" | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
RUN wget -O key https://packages.cloud.google.com/apt/doc/apt-key.gpg && apt-key add key && rm key
RUN apt update && apt -y install google-cloud-sdk kubectl

# install stern

RUN wget -O /usr/bin/stern https://github.com/wercker/stern/releases/download/1.10.0/stern_linux_amd64 \
 && chmod +x /usr/bin/stern

# install helm
RUN wget -O /tmp/helm.tar.gz https://storage.googleapis.com/kubernetes-helm/helm-v2.13.1-linux-amd64.tar.gz \
 && tar xvzf /tmp/helm.tar.gz \
 && mv linux-amd64/helm /usr/bin/ \
 && chmod +x /usr/bin/helm
