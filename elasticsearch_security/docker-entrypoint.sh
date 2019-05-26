#!/bin/bash
set -e


# Elasticsearch globals
ELASTICSEARCH="/usr/share/elasticsearch"

# elasticsearch-certutil globals
CERTUTIL="${ELASTICSEARCH}/bin/elasticsearch-certutil --silent"
CERTUTIL_OUT="${ELASTICSEARCH}/config/certs"
CA_OUT="${CERTUTIL_OUT}/elastic-stack-ca.p12"
PKCS_OUT="${CERTUTIL_OUT}/elastic-certificates.p12"

# elasticsearch-setup-passwords globals
SETPASSWD="${ELASTICSEARCH}/bin/elasticsearch-setup-passwords"
PASSWORDS_OUT="${ELASTICSEARCH}/passwords.txt"


function log {
    echo $(date +"%Y-%m-%d %H:%M:%S") "-" $1
}


function auto_certify {
    # Generates Root CA
    if [ ! -e ${CA_OUT} ]; then
        log "auto_certify - INFO - Generating Root CA: CA_OUT='${CA_OUT}'" 
        ${CERTUTIL} ca --pass "" --out ${CA_OUT}
    else
        log "auto_certify - INFO - Root CA already exists, bypassing: CA_OUT='${CA_OUT}'"
    fi
    # Generates PKCS#12
    if [ ! -e ${PKCS_OUT} ]; then
        log "auto_certify - INFO - Generating PKCS#12: CA_OUT='${CA_OUT}', PKCS_OUT='${PKCS_OUT}'"
        ${CERTUTIL} cert --ca ${CA_OUT} --ca-pass "" --pass "" --out ${PKCS_OUT}
    else
        log "auto_certify - INFO - PKCS#12 already exists, bypassing: PKCS_OUT='${PKCS_OUT}'"
    fi
}


function auto_passwd {
    if [ -z "$1" ]; then
        log "auto_passwd - ERROR - No Elasticsearch node URL provided (expecting 'https://<hostname_or_ip>:9200')"
        exit 1
    else
        log "auto_passwd - INFO - Bootstraping passwords: node='${1}'"
        ${SETPASSWD} --silent auto -u ${1} > ${PASSWORDS_OUT}
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