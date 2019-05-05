FROM docker.elastic.co/elasticsearch/elasticsearch:7.0.0

# Copy configuration
RUN rm -f /usr/share/elasticsearch/config/elasticsearch.yml
COPY --chown=1000:1000 config/elasticsearch.yml /usr/share/elasticsearch/config/

# Install Search Guard
ARG SEARCHGUARD_PLUGIN=com.floragunn:search-guard-7:7.0.0-35.0.0-rc1
RUN /usr/share/elasticsearch/bin/elasticsearch-plugin install --batch ${SEARCHGUARD_PLUGIN}