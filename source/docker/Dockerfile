FROM elasticsearch:7.5.0
COPY config/elasticsearch.yml /usr/share/elasticsearch/config/
RUN apt-get install wget tar unzip \
    && bin/elasticsearch-plugin install analysis-icu \
    && wget https://artifacts.elastic.co/downloads/logstash/logstash-5.2.1.tar.gz \
    && tar -zxvf logstash-5.2.1.tar.gz \
    && wget https://dev.mysql.com/get/Downloads/Connector-J/mysql-connector-java-5.1.47.zip \
    && unzip mysql-connector-java-5.1.47.zip \
    && cp mysql-connector-java-5.1.47/mysql-connector-java-5.1.47-bin.jar /usr/share/elasticsearch \
    && rm -rf logstash-5.2.1.tar.gz mysql-connector-java-5.1.47.zip mysql-connector-java-5.1.47