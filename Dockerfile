FROM ubuntu:20.04
RUN apt update
RUN apt -y install manpages-ja manpages-ja-dev language-pack-ja
RUN update-locale LANG=ja_JP.UTF-8
RUN useradd -m shellgei && echo "shellgei:160" | chpasswd && usermod -aG sudo shellgei
RUN apt install sudo
USER shellgei
WORKDIR /home/shellgei
CMD [ "sleep", "infinity" ]
