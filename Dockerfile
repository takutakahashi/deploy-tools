FROM ubuntu

RUN apt update && apt install -y vim wget gnupg lsb-release unzip \
 && export CLOUD_SDK_REPO="cloud-sdk-$(lsb_release -c -s)" \
 && echo "deb http://packages.cloud.google.com/apt $CLOUD_SDK_REPO main" | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
RUN wget -O key https://packages.cloud.google.com/apt/doc/apt-key.gpg && apt-key add key && rm key
RUN apt update && apt -y install google-cloud-sdk kubectl docker.io

# install stern
RUN wget -O /usr/bin/stern https://github.com/wercker/stern/releases/download/1.10.0/stern_linux_amd64 \
 && chmod +x /usr/bin/stern

# install helm
RUN wget -O /tmp/helm.tar.gz https://storage.googleapis.com/kubernetes-helm/helm-v2.13.1-linux-amd64.tar.gz \
 && tar xvzf /tmp/helm.tar.gz \
 && mv linux-amd64/helm /usr/bin/ \
 && chmod +x /usr/bin/helm

# install kube-prompt
RUN wget -O kp.zip https://github.com/c-bata/kube-prompt/releases/download/v1.0.6/kube-prompt_v1.0.6_linux_amd64.zip \
 && unzip kp.zip \
 && mv kube-prompt /usr/bin/ \
 && rm kp.zip

# add files
ADD start.sh /
ADD .bash_profile /root/

# start
CMD ["/start.sh"]
