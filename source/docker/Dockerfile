FROM elasticsearch:5.0.2
COPY config/elasticsearch.yml /usr/share/elasticsearch/config/
RUN bin/elasticsearch-plugin install analysis-icu
RUN apt-get install wget
RUN wget https://artifacts.elastic.co/downloads/logstash/logstash-5.2.1.tar.gz
RUN apt-get install tar
RUN tar -zxvf logstash-5.2.1.tar.gz
RUN wget https://dev.mysql.com/get/Downloads/Connector-J/mysql-connector-java-5.1.47.zip
RUN apt-get install unzip
RUN unzip mysql-connector-java-5.1.47.zip
RUN cp mysql-connector-java-5.1.47/mysql-connector-java-5.1.47-bin.jar /usr/share/elasticsearch/