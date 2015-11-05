@echo off
SET PATH=%~dp0;%PATH%

"%~dp0node" "%~dp0..\..\..\packages\MSBuild.Node.Local.1.0.0\tools\node_modules\bower\bin\bower" %*
