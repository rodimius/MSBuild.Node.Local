@echo off
SET PATH=%~dp0;%PATH%
"%~dp0node" "%~dp0..\..\packages\Betclic.BuildTools.Node.1.0.4\node_modules\nogit\bin\git.js" %*
