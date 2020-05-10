FROM ubuntu:18.04
RUN set -xe \
    && apt -qq update \
    && apt -y -qq upgrade \
    && apt -y -qq install apt-utils tzdata locales 
ENV TZ=Asia/Seoul
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime \
     && echo $TZ > /etc/timezone
RUN set -xe &&\
    dpkg-reconfigure --frontend=noninteractive tzdata && \
    sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && \
    echo 'LANG="en_US.UTF-8"'>/etc/default/locale && \
    dpkg-reconfigure --frontend=noninteractive locales && \
    update-locale LANG=en_US.UTF-8

ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8
ENV LC_ALL en_US.UTF-8

RUN yes | unminimize
RUN set -xe \
    && apt -y -qq install vim perl wget tar man sudo adduser netstat-nat net-tools curl w3m git build-essential xxd file git make build-essential wget \
    && useradd -m -p "\$6\$AyOAQ1vh\$CcIXBW4cJopgUVKsTcxlGplUZ382K4yIxIAHhqmEewzJdc6x0MmbSDDQJ1DR.4eueGlYTf2ZbUl9oAQaUQEoi1" -s /bin/bash ccsss \
    && usermod -aG sudo ccsss \
    && echo "ccsss ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/ccsss \
    && chmod 0440 /etc/sudoers.d/ccsss 

USER ccsss:ccsss

WORKDIR /home/ccsss

CMD [ "/bin/bash" ]