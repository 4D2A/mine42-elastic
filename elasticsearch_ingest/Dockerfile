FROM docker.elastic.co/elasticsearch/elasticsearch:6.7.0

# Copy configuration
RUN rm -f /usr/share/elasticsearch/config/elasticsearch.yml
COPY --chown=1000:1000 config/elasticsearch.yml /usr/share/elasticsearch/config/
