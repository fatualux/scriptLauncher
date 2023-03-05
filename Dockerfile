# Dockerfile code from translate-shell (https://github.com/soimort/translate-shell)

FROM alpine:latest

RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories

RUN apk add bash gawk curl mplayer fribidi less hunspell wget yt-dlp ffmpeg w3m \
    && wget https://raw.githubusercontent.com/soimort/translate-shell/gh-pages/trans \
    && chmod +x ./trans \
    && mv ./trans /usr/local/bin/trans \
    && rm -rf /var/cache/apk/*

COPY ./ /scriptLauncher/
WORKDIR /scriptLauncher/
ADD . /scriptLauncher/

SHELL ["/bin/bash"]
CMD ["sh", "scriptLauncher.sh"]
