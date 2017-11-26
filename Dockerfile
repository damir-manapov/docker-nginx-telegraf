FROM nginx

RUN apt-get update && \
    apt-get install -y apt-transport-https curl nano gnupg procps && \
    curl -sL https://repos.influxdata.com/influxdb.key | apt-key add -
RUN echo "deb https://repos.influxdata.com/debian stretch stable" | tee /etc/apt/sources.list.d/influxdb.list
RUN apt-get update && apt-get install -y telegraf
RUN echo '[[inputs.nginx]]' >> /etc/telegraf/telegraf.conf && \
    echo '  urls = ["http://localhost/nginx_status"]' >> /etc/telegraf/telegraf.conf
