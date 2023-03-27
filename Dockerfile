FROM ubuntu:20.04
RUN useradd -m shellgei && echo "shellgei:160" | chpasswd && usermod -aG sudo shellgei
RUN yes | unminimize
RUN apt update
RUN apt -y install manpages-ja manpages-ja-dev language-pack-ja man-db bc sudo
RUN update-locale LANG=ja_JP.UTF-8
USER shellgei
WORKDIR /home/shellgei
CMD [ "sleep", "infinity" ]
