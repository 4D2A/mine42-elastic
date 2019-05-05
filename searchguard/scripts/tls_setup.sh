#!/bin/bash
source `dirname $0`/common.sh


loginfo "setting-up Search Guard TLS: TLSTOOL_CONFIG='${TLSTOOL_CONFIG}', TLSTOOL_OUTPUT='${TLSTOOL_OUTPUT}'"
${TLSTOOL_ROOT}/tools/sgtlstool.sh -c ${TLSTOOL_CONFIG} -crt -ca -t ${TLSTOOL_OUTPUT}