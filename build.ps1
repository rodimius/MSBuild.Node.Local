Param(
		[parameter(Position=0)][String]$Verb,
		[switch]$NoPack
     )

Function Build()
{
	npm install
	npm dedup
}

Function Pack()
{
	nuget pack .\MSBuild.Node.Local.nuspec -NoDefaultExcludes
}

Function Clean()
{
	rimraf node_modules\*

	rimraf node_modules\.bin\*
}

Switch ($Verb)
{
	"clean"
	{
		Clean
	}
	"rebuild"
	{
		Clean
		Build
	}
	default 
	{
		Build
		if ( !($NoPack) )
		{
			Pack
		}
	}
}

