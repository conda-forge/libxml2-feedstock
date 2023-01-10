@if defined xml_catalog_files_libxslt (
    @set XML_CATALOG_FILES=%xml_catalog_files_libxslt%
) else (
    @set XML_CATALOG_FILES=
)
@set xml_catalog_files_libxslt=
