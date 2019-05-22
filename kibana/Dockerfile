FROM docker.elastic.co/kibana/kibana:7.1.0

# Copy configuration
RUN rm -f /usr/share/kibana/config/kibana.yml
COPY --chown=1000:1000 config/kibana.yml /usr/share/kibana/config/

# Install Search Guard
# CMD /usr/share/kibana/bin/kibana-plugin install https://search.maven.org/remotecontent?filepath=com/floragunn/search-guard-kibana-plugin/7.0.0-35.0.0-rc1/search-guard-kibana-plugin-7.0.0-35.0.0-rc1.zip
