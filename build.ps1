Param(
		[switch]$Clean
     )

if ( $Clean )
{
	rimraf node_modules\*

	rimraf node_modules\.bin\*
}

npm install
npm dedup

if ( !$NoPack )
{
	nuget pack .\MSBuild.Node.Local.nuspec -NoDefaultExcludes
}
