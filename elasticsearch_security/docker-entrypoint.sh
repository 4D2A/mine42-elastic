#!/bin/bash
set -e


# Elasticsearch globals
ELASTICSEARCH="/usr/share/elasticsearch"

# elasticsearch-certutil globals
CERTUTIL="${ELASTICSEARCH}/bin/elasticsearch-certutil --silent"
CERTUTIL_OUT="${ELASTICSEARCH}/config/certs"
CA_PKCS12_OUT="${CERTUTIL_OUT}/elastic-stack-ca.p12"
CA_PEM_OUT="${CERTUTIL_OUT}/elastic-stack-ca.pem"
CERT_PKCS12_OUT="${CERTUTIL_OUT}/elastic-certificates.p12"

# elasticsearch-setup-passwords globals
SETPASSWD="${ELASTICSEARCH}/bin/elasticsearch-setup-passwords"


function log {
    echo $(date +"%Y-%m-%d %H:%M:%S") "-" $1
}


function auto_certify {
    # Generates Root CA
    if [ ! -e ${CA_PKCS12_OUT} ]; then
        log "auto_certify - INFO - Generating root CA: CA_PKCS12_OUT='${CA_PKCS12_OUT}'" 
        ${CERTUTIL} ca --pass "" --out ${CA_PKCS12_OUT}
    else
        log "auto_certify - INFO - Root CA already exists, bypassing: CA_PKCS12_OUT='${CA_PKCS12_OUT}'"
    fi
    # Generates nodes common certificate
    if [ ! -e ${CERT_PKCS12_OUT} ]; then
        log "auto_certify - INFO - Generating nodes common certificate: CA_PKCS12_OUT='${CA_PKCS12_OUT}', CERT_PKCS12_OUT='${CERT_PKCS12_OUT}'"
        ${CERTUTIL} cert --ca ${CA_PKCS12_OUT} --ca-pass "" --pass "" --out ${CERT_PKCS12_OUT}
    else
        log "auto_certify - INFO - Nodes common certificate already exists, bypassing: CERT_PKCS12_OUT='${CERT_PKCS12_OUT}'"
    fi
    # Duplicate Root CA from PKCS12 to PEM
    log "auto_certify - INFO - Duplicating root CA from PKCS12 to PEM: CA_PKCS12_OUT='${CA_PKCS12_OUT}', CA_PEM_OUT='${CA_PEM_OUT}'"
    openssl pkcs12 -in ${CA_PKCS12_OUT} -clcerts -nokeys -chain -out ${CA_PEM_OUT}
}


function auto_passwd {
    if [ -z "$1" ]; then
        log "auto_passwd - ERROR - No Elasticsearch node URL provided (expecting 'https://<hostname_or_ip>:9200')"
        exit 1
    else
        log "auto_passwd - INFO - Bootstraping passwords: node='${1}'"
        ${SETPASSWD} auto -u ${1}
    fi
}


function help {
    echo "Usage: $0 {auto-certify|auto-passwd [node URL (https)]}"
    exit
}


if [ -z "$1" ]; then do_help; fi
case $1 in
    "auto-certify") shift; auto_certify $@;;
    "auto-passwd") shift; auto_passwd $@;;
    "pass") exit;;
    *) shift; help;;
esac