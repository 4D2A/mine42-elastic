FROM docker.elastic.co/logstash/logstash-oss:6.7.0

# Base configuration
# ==================
# Purge default configuration and pipelines
RUN rm -f /usr/share/logstash/config/*
RUN rm -f /usr/share/logstash/pipeline/*
# Copy custom configuration
ADD config/*.yml /usr/share/logstash/config/
# Copy custom pipelines
ADD pipeline/*.conf /usr/share/logstash/pipeline/

# Pipelines configuration
# =======================
# Pipeline http_json
EXPOSE 8080/tcp