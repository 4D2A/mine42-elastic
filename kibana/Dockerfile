FROM docker.elastic.co/kibana/kibana:6.7.0

# Copy configuration
RUN rm -f /usr/share/kibana/config/kibana.yml
COPY --chown=1000:1000 config/kibana.yml /usr/share/kibana/config/
