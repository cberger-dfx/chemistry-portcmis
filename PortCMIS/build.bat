@echo off

rem
rem Licensed to the Apache Software Foundation (ASF) under one
rem or more contributor license agreements. See the NOTICE file
rem distributed with this work for additional information
rem regarding copyright ownership. The ASF licenses this file
rem to you under the Apache License, Version 2.0 (the
rem "License"); you may not use this file except in compliance
rem with the License. You may obtain a copy of the License at
rem
rem http://www.apache.org/licenses/LICENSE-2.0
rem
rem Unless required by applicable law or agreed to in writing,
rem software distributed under the License is distributed on an
rem "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
rem KIND, either express or implied. See the License for the
rem specific language governing permissions and limitations
rem under the License.

echo Removing old DLLs
rmdir /Q /S bin
rmdir /Q /S obj
rmdir /Q /S nupkg

echo Building Debug DLL...
msbuild PortCMIS.csproj /p:Configuration=Debug

echo Building Release DLL...
msbuild PortCMIS.csproj /p:Configuration=Release

mkdir nupkg
nuget pack -version %PACKAGE_VERSION% PortCMIS.nuspec -OutputDirectory nupkg

rem echo Building documentation...
rem msbuild PortCMIS.shfbproj /p:Configuration=Release