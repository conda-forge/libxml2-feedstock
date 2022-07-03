
cd win32

cscript configure.js compiler=msvc iconv=yes icu=no zlib=yes lzma=no python=no ^
                     prefix=%LIBRARY_PREFIX% ^
                     include=%LIBRARY_INC% ^
                     lib=%LIBRARY_LIB%

if errorlevel 1 exit 1

nmake /f Makefile.msvc
if errorlevel 1 exit 1

nmake /f Makefile.msvc install
if errorlevel 1 exit 1

:: These programs are listed as "check_PROGRAMS"
:: Under the unix makefile
:: https://gitlab.gnome.org/GNOME/libxml2/-/blob/master/Makefile.am
:: But are always installed for windows ....
:: https://gitlab.gnome.org/GNOME/libxml2/-/blob/master/win32/Makefile.msvc#L257
del %LIBRARY_PREFIX%\bin\test*.exe || exit 1
del %LIBRARY_PREFIX%\bin\runsuite.exe || exit 1
del %LIBRARY_PREFIX%\bin\runtest.exe || exit 1
del %LIBRARY_PREFIX%\bin\runxmlconf.exe || exit 1
copy %LIBRARY_LIB%\libxml2.lib %LIBRARY_LIB%\xml2.lib || exit 1
