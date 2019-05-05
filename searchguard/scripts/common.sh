SG_ROOT = "/usr/share/searchguard"
SG_TMP = "/tmp/searchguard"

TLSTOOL_ROOT = ${SG_ROOT}/tlstool
TLSTOOL_ARCHIVE = ${SG_TMP}/tlstool.tar.gz
TLSTOOL_CONFIG = ${SG_ROOT}/config/tlstool
TLSTOOL_OUTPUT = ${SG_ROOT}/output/tlstool
TLSTOOL_URL = "https://search.maven.org/remotecontent?filepath=com/floragunn/search-guard-tlstool/1.6/search-guard-tlstool-1.6.tar.gz"

SGADMIN_ROOT = ${SG_ROOT}/sgadmin
SGADMIN_ARCHIVE = ${SG_TMP}/sgadmin.tar.gz
SGADMIN_CONFIG = ${SG_ROOT}/config/sgadmin
SGADMIN_URL = "https://search.maven.org/remotecontent?filepath=com/floragunn/search-guard-7/7.0.0-35.0.0-rc1/search-guard-7-7.0.0-35.0.0-rc1-sgadmin-standalone.tar.gz"


function loginfo {
    date +"%Y-%m-%d %H:%M:%S - INFO - $1"
}