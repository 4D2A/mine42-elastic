#!/bin/bash
source `dirname $0`/common.sh


loginfo "initializing: SG_ROOT='${SG_ROOT}', SG_TMP='${SG_TMP}'"
mkdir -p ${SG_ROOT}
mkdir -p ${SG_TMP}

loginfo "installing OpenJDK"
apt-get update
apt-get install openjdk-11-jre-headless

loginfo "downloading Search Guard components: TLSTOOL_URL='${TLSTOOL_URL}', SGADMIN_URL='${SGADMIN_URL}''"
wget ${TLSTOOL_URL} -O ${TLSTOOL_ARCHIVE}
wget ${SGADMIN_URL} -O ${SGADMIN_ARCHIVE}

loginfo "installing Offline TLS tool: TLSTOOL_ROOT='${TLSTOOL_ROOT}', TLSTOOL_ARCHIVE='${TLSTOOL_ARCHIVE}'"
mkdir -p ${TLSTOOL_ROOT}
tar -xf ${TLSTOOL_ARCHIVE} -C ${TLSTOOL_ROOT}

loginfo "installing Search Guard Admin: SGADMIN_ROOT='${SGADMIN_ROOT}', SGADMIN_ARCHIVE='${SGADMIN_ARCHIVE}'"
mkdir -p ${SGADMIN_ROOT}
tar -xf ${SGADMIN_ARCHIVE} -C ${SGADMIN_ROOT}
