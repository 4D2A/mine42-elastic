# Mine42 - Elastic
Default Elastic stack infrastructure for **Mine42**.

The repository contains:
* 5 customized Elastic stack Docker images (*Master*, *Data* and *Ingestion* nodes, *Kibana* and *Logstash*)
* 1 customized *Elasticsearch* Docker image to generate basic Elastic stack certificates
* 1 Docker compose file to bootstrap a basic infrastructure


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
> **Description**: An `elasticsearch-certutil` wrapper to automatically generate the required certificates  
> **More information**: `elasticsearch_certutil/README.md`


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
> **Description**: Basic Elastic stack infrastructure  
