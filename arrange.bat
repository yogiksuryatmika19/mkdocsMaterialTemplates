@echo off
setlocal enabledelayedexpansion

set "DOCS_DIR=docs"

for /d %%D in ("%DOCS_DIR%\*") do (
    set "FOLDER_NAME=%%~nxD"

    rem Skip stylesheets and javascripts
    if /I not "!FOLDER_NAME!"=="stylesheets" if /I not "!FOLDER_NAME!"=="javascripts" (

        rem Create/overwrite arrange.txt
        > "%%D\arrange.txt" (
            for %%F in ("%%D\*.md") do (
                echo - %%~nxF
            )
        )

        echo Generated: %%D\arrange.txt
    )
)

echo Done.
pause