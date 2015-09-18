rimraf node_modules\*

rimraf node_modules\.bin\*

npm install
npm dedup

nuget pack .\MSBuild.Node.Local.nuspec -NoDefaultExcludes
