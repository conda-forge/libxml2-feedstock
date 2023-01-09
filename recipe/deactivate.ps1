if ($Env:xml_catalog_files_libxslt) {
   $Env:XML_CATALOG_FILES = "$Env:xml_catalog_files_libxslt"
} else {
   $Env:XML_CATALOG_FILES = ''
}
$Env:xml_catalog_files_libxslt = ''
