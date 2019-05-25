#!/bin/bash
set -e


CERTUTIL="/usr/share/elasticsearch/bin/elasticsearch-certutil --silent"
CERTUTIL_OUT="/usr/share/elasticsearch/config/certs"
CA_OUT="${CERTUTIL_OUT}/elastic-stack-ca.p12"
PKCS_OUT="${CERTUTIL_OUT}/elastic-certificates.p12"


function log {
    echo $(date +"%Y-%m-%d %H:%M:%S") "-" $1
}


function do_auto {
    # Generates Root CA
    if [ ! -e ${CA_OUT} ]; then
        log "do_auto - generating Root CA: CA_OUT='${CA_OUT}'" 
        ${CERTUTIL} ca --pass "" --out ${CA_OUT}
    else
        log "do_auto - Root CA already exists, bypassing: CA_OUT='${CA_OUT}'"
    fi
    # Generates PKCS#12
    if [ ! -e ${PKCS_OUT} ]; then
        log "do_auto - generating PKCS#12: CA_OUT='${CA_OUT}', PKCS_OUT='${PKCS_OUT}'"
        ${CERTUTIL} cert --ca ${CA_OUT} --ca-pass "" --pass "" --out ${PKCS_OUT}
    else
        log "do_auto - PKCS#12 already exists, bypassing: PKCS_OUT='${PKCS_OUT}'"
    fi
}


function do_help {
    log "Usage: $0 {auto|help}"
    exit
}


if [ -z "$1" ]; then do_help; fi
case $1 in
    "auto") shift; do_auto $@;;
    *) shift; do_help;;
esac