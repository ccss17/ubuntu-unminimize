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
    && apt -y -qq install vim tmux perl wget tar man sudo adduser netstat-nat net-tools curl w3m git build-essential xxd file git make build-essential wget libcurses-perl nyancat sl python python3-pip zlib1g libjpeg8-dev zlib1g-dev\
    && useradd -m -p "\$6\$ZEHyOJAy\$697kSQRpVsSnvU4oDl6BtR1LDrHltFPoqvdMJd9Bc0Msfz./iExfCcm7fxt7ZBzOKxAFCpdaj7aTzayT1L.pf/" -s /bin/bash ccsss \
    && usermod -aG sudo ccsss \
    && echo "ccsss ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/ccsss \
    && chmod 0440 /etc/sudoers.d/ccsss 
    # asciiquarium
    && cd
    && wget http://search.cpan.org/CPAN/authors/id/K/KB/KBAUCOM/Term-Animation-2.4.tar.gz
    && tar -zxvf Term-Animation-2.4.tar.gz
    && cd Term-Animation-2.4/
    && perl Makefile.PL && make && make test
    && make install
    && cd
    && wget http://www.robobunny.com/projects/asciiquarium/asciiquarium.tar.gz
    && tar -zxvf asciiquarium.tar.gz
    && cd asciiquarium_1.1/
    && chmod +x asciiquarium
    && cp asciiquarium /usr/local/bin/
    # ChristBASHTree
    && cd
    && wget -d -c -O /usr/local/bin/ChristBASHTree "https://raw.githubusercontent.com/sergiolepore/ChristBASHTree/master/tree-EN.sh"
    && chmod +x /usr/local/bin/ChristBASHTree
    # unimatrix
    && wget https://raw.githubusercontent.com/will8211/unimatrix/master/unimatrix.py -O /usr/local/bin/unimatrix
    && chmod a+rx /usr/local/bin/unimatrix
    # pipes.sh
    && cd
    && git clone https://github.com/pipeseroni/pipes.sh
    && cd pipes.sh
    && make install
    # Python Packages
    && pip3 install YuleLog numpy colorama

USER ccsss:ccsss
WORKDIR /home/ccsss

COPY start.sh /
CMD ["/start.sh"]
