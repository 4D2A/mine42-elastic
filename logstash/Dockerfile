FROM docker.elastic.co/logstash/logstash:7.1.0

# Copy configuration
RUN rm -f /usr/share/logstash/config/logstash.yml
COPY --chown=1000:1000 config/logstash.yml /usr/share/logstash/config/
# Copy pipelines
RUN rm -f /usr/share/logstash/pipeline/*
COPY --chown=1000:1000 pipeline/* /usr/share/logstash/pipeline/
# Setup pipeline http_json
EXPOSE 8080/tcp
