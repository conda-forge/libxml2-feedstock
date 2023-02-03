#!/bin/bash

if test -n "${XML_CATALOG_FILES:-}"; then
    export xml_catalog_files_libxml2="${XML_CATALOG_FILES}"
    XML_CATALOG_FILES+=" "
else
    export xml_catalog_files_libxml2=""
    XML_CATALOG_FILES=""
fi

conda_catalog_files="file://${CONDA_PREFIX// /%20}/etc/xml/catalog file:///etc/xml/catalog"
export XML_CATALOG_FILES+="${conda_catalog_files}"
