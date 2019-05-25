FROM docker.elastic.co/elasticsearch/elasticsearch:7.1.0

# Copy configuration
RUN rm -f /usr/share/elasticsearch/config/elasticsearch.yml
COPY --chown=1000:1000 config/elasticsearch.yml /usr/share/elasticsearch/config/

# Generate cluster PKI
ARG CERTUTIL="/usr/share/elasticsearch/bin/elasticsearch-certutil"
WORKDIR /usr/share/elasticsearch/config/certs
## Generate root CA
RUN if [ ! -e "elastic-stack-ca.p12" ]; then \
    $CERTUTIL ca --pass "" --out "/usr/share/elasticsearch/config/certs/elastic-stack-ca.p12"; fi
## Generate shared certificate
RUN if [ ! -e "elastic-certificates.p12" ]; then \
    $CERTUTIL cert --ca "/usr/share/elasticsearch/config/certs/elastic-stack-ca.p12" --ca-pass "" --pass "" --out "/usr/share/elasticsearch/config/certs/elastic-certificates.p12"; fi
