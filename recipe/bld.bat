
cd win32

:: Have to set manifest for VS2008.
:: No idea why, but exe's won't run otherwise.
set MANIFEST=no
if "%VS_MAJOR%" == "9" (
    set MANIFEST=yes
)

cscript configure.js compiler=msvc iconv=yes icu=no zlib=yes lzma=no python=no ^
                     vcmanifest=%MANIFEST% ^
                     prefix=%LIBRARY_PREFIX% ^
                     include=%LIBRARY_INC% ^
                     lib=%LIBRARY_LIB%

if errorlevel 1 exit 1

nmake /f Makefile.msvc
if errorlevel 1 exit 1

nmake /f Makefile.msvc install
if errorlevel 1 exit 1

del %LIBRARY_PREFIX%\bin\test*.exe || exit 1
del %LIBRARY_PREFIX%\bin\runsuite.exe || exit 1
del %LIBRARY_PREFIX%\bin\runtest.exe || exit 1
copy %LIBRARY_LIB%\libxml2.lib %LIBRARY_LIB%\xml2.lib || exit 1
