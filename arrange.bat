@echo off
setlocal enabledelayedexpansion

set "DOCS_DIR=docs"

for /d %%D in ("%DOCS_DIR%\*") do (
    set "FOLDER_NAME=%%~nxD"

    rem Skip specific folders
    if /I not "!FOLDER_NAME!"=="stylesheets" if /I not "!FOLDER_NAME!"=="javascripts" if /I not "!FOLDER_NAME!"=="Images" (

        rem Create/overwrite arrange.txt
        > "%%D\arrange.txt" (

            rem Header
            echo nav:
            echo.

            rem List all markdown files
            for %%F in ("%%D\*.md") do (
                echo - %%~nxF
            )

            rem Empty line before footer
            echo.

            rem Footer
            echo - ...
        )

        echo Generated: %%D\arrange.txt

        rem Check if .pages exists
        if not exist "%%D\.pages" (
            type nul > "%%D\.pages"
            echo Created: %%D\.pages
        ) else (
            echo Skipped existing: %%D\.pages
        )
    )
)

echo Done.
pause