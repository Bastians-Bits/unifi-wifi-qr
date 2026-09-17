FROM httpd

RUN apt-get install --update -y --no-install-recommends jq curl qrencode  && apt-get clean

ADD ./files /data
ADD ./web/index.html.template /usr/local/apache2/htdocs

WORKDIR /data
CMD [ "./runner.sh" ]