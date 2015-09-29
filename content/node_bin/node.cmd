@echo off
SET PATH=%PATH%;%~dp0
"%~dp0..\..\..\packages\MSBuild.Node.Local.1.0.0\tools\node.exe" %*
