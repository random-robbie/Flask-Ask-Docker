FROM python:3

LABEL maintainer="txt3rob@gmail.com"

ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

RUN apt-get update && apt-get upgrade -y
RUN apt-get install nano wget curl net-tools unzip supervisor screen -y
RUN sed -i 's/^\(\[supervisord\]\)$/\1\nnodaemon=true/' /etc/supervisor/supervisord.conf
ADD https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip /ngrok.zip
RUN set -x \
 && unzip -o /ngrok.zip -d /bin \
 && rm -f /ngrok.zip
WORKDIR /
COPY . /spacegeek/
RUN pip install flask flask-ask
ADD ngrok.yml /root/ngrok.yml
ADD entrypoint.sh ./entrypoint.sh
RUN chmod 777 entrypoint.sh
COPY supervisord.conf /etc/supervisor/supervisord.conf
EXPOSE 5000 4040
ENTRYPOINT ["./entrypoint.sh"]
