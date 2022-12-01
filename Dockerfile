FROM python:3.10-alpine

ARG LOCAL_USER_ID=1001
ARG LOCAL_GROUP_ID=1001
RUN addgroup -g $LOCAL_GROUP_ID ydl
RUN adduser -u $LOCAL_USER_ID -D -G ydl ydl

USER root
WORKDIR /usr/app
COPY ./ /usr/app

USER ydl
RUN pip install -r requirements.txt

EXPOSE 9191
ENTRYPOINT [ "python", "-m", "youtube_dl_server" ]
