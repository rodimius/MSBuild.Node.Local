Param(
		[switch]$Clean,
		[switch]$NoPack
     )

if ( $Clean )
{
	rimraf node_modules\*

	rimraf node_modules\.bin\*

	Exit
}

npm install
npm dedup

if ( !($NoPack) )
{
	nuget pack .\MSBuild.Node.Local.nuspec -NoDefaultExcludes
}
