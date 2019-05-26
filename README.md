# Mine42 - Elastic

Default Elastic stack infrastructure for **Mine42**.

The repository contains:

* 5 customized Elastic stack Docker images (*Master*, *Data* and *Ingestion* nodes, *Kibana* and *Logstash*)
* 1 customized *Elasticsearch* Docker image to generate basic Elastic stack certificates
* 1 Docker compose file to bootstrap a basic infrastructure

## Quickstart

* Clone the repository: `git clone https://github.com/4D2A/mine42-elastic`
* Optional: customize the default `docker-compose.yml`
* Build the stack: `docker-compose -p elastic build --no-cache`
* Generate the new certificates: `docker-compose -p elastic run security auto-certify`
* Start the stack: `docker-compose -p elastic up -d`
* Generate the Elastic stack passwords: `docker-compose -p elastic run security auto-passwd`

## Components

### `elasticsearch_master`

> **Type**: Docker image  
> **Description**: A preconfigured Elasticsearch's *master* node  
> **More information**: `elasticsearch_master/README.md`

### `elasticsearch_data`

> **Type**: Docker image  
> **Description**: A preconfigured Elasticsearch's *data* node  
> **More information**: `elasticsearch_data/README.md`

### `elasticsearch_ingest`

> **Type**: Docker image  
> **Description**: A preconfigured Elasticsearch's *ingestion* node  
> **More information**: `elasticsearch_ingest/README.md`

### `elasticsearch_certutil`

> **Type**: Docker image  
> **Description**: An security tools wrapper to automatically generate certificates and passwords  
> **More information**: `elasticsearch_security/README.md`

### `kibana`

> **Type**: Docker image  
> **Description**: A preconfigured Kibana node  
> **More information**: `kibana/README.md`

### `logstash`

> **Type**: Docker image  
> **Description**: A preconfigured Logstash node  
> **More information**: `logstash/README.md`

### `docker-compose.yml`

> **Type**: Docker compose file  
> **Description**: Elastic stack infrastructure  
