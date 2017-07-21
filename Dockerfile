FROM unidata/thredds-docker:4.6.10
RUN apt-get update && apt-get install -y python3 python3-pip
RUN pip3 install boto3 jinja2
COPY ingest.py /usr/local/src/ingest.py
COPY threddsConfig.xml /usr/local/tomcat/content/thredds/threddsConfig.xml
COPY ./src/templates/catalog.jinja /usr/local/src/catalog.jinja
COPY go.sh /go.sh
COPY target/s3datasetsource-1.0-SNAPSHOT-jar-with-dependencies.jar /usr/local/tomcat/webapps/thredds/WEB-INF/lib/s3datasetsource-1.0-SNAPSHOT-jar-with-dependencies.jar
ENTRYPOINT [""]
CMD ["/go.sh"]