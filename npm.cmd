@echo off
SET PATH=%~dp0;%PATH%
"%~dp0node" "%~dp0node_modules\npm\bin\npm-cli.js" %*
