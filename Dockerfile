FROM ubuntu:xenial
MAINTAINER Tsiry Sandratraina

RUN apt-get update -y
RUN apt-get install -y  curl

WORKDIR /tmp
RUN curl https://get.parity.io -Lk > get-parity.sh
RUN sed -i "s/setup_0.12/setup_6.x/g" get-parity.sh
RUN chmod a+x get-parity.sh
RUN ./get-parity.sh

RUN apt-get install nginx -y
ADD . /opt

EXPOSE 8540
EXPOSE 8541
EXPOSE 8542
EXPOSE 8543
EXPOSE 30300
EXPOSE 8180
EXPOSE 8080
EXPOSE 8181
EXPOSE 8081
EXPOSE 8182
EXPOSE 8082
EXPOSE 8183
EXPOSE 8083
EXPOSE 8184
EXPOSE 8084
EXPOSE 8185
EXPOSE 8085
EXPOSE 8186
EXPOSE 8086
EXPOSE 8187
EXPOSE 8087
EXPOSE 8188
EXPOSE 8088
EXPOSE 8189
EXPOSE 8089

COPY nginx-config/parity.ui /etc/nginx/sites-enabled/

WORKDIR /opt
RUN chmod a+x start-nginx.sh
RUN chmod a+x start-parity.sh

CMD ./start-nginx.sh && ./start-parity.sh