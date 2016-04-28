cd win32
cscript configure.js compiler=msvc prefix=%LIBRARY_PREFIX% ^
        include=%LIBRARY_INC% lib=%LIBRARY_LIB% ^
        icu=no zlib=yes iconv=no
nmake /f Makefile.msvc
nmake /f Makefile.msvc install
