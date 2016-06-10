
cd win32

cscript configure.js compiler=msvc iconv=yes icu=no zlib=yes lzma=no python=no ^
        prefix=%LIBRARY_PREFIX% include=%LIBRARY_INC% lib=%LIBRARY_LIB%

if errorlevel 1 exit 1

nmake /f Makefile.msvc
if errorlevel 1 exit 1

nmake /f Makefile.msvc install
if errorlevel 1 exit 1
