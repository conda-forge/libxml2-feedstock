
mkdir build
cd build

cmake -D CMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX% ^
-D CMAKE_PREFIX_PATH=%LIBRARY_PREFIX% ^
-D CMAKE_BUILD_TYPE=Release ^
-D LIBXML2_WITH_ICU=%with_icu%
-G "NMake Makefiles" ..
if errorlevel 1 exit 1

nmake
if errorlevel 1 exit 1

setlocal EnableDelayedExpansion
for %%F in (activate deactivate) DO (
    if not exist %PREFIX%\etc\conda\%%F.d mkdir %PREFIX%\etc\conda\%%F.d
    copy %RECIPE_DIR%\%%F.bat %PREFIX%\etc\conda\%%F.d\%PKG_NAME%_%%F.bat
    copy %RECIPE_DIR%\%%F.ps1 %PREFIX%\etc\conda\%%F.d\%PKG_NAME%_%%F.ps1
    copy %RECIPE_DIR%\%%F.sh %PREFIX%\etc\conda\%%F.d\%PKG_NAME%_%%F.sh
)
