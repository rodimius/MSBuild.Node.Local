Param(
		[parameter(Position=0)][String]$Verb,
		[switch]$NoPack
     )

Function Build()
{
	npm install
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

Function Write-Target($target)
{
	Write-Host ("Target: " + $Verb)
}

Function Write-Completed($target)
{
	Write-Host ("Completed: " + $Verb)
}

Function Wrap-Target{
	Param([scriptblock]$targetFunction)

	Write-Target($Verb)
	$targetFunction.Invoke()
	Write-Completed($Verb)
}

Switch ($Verb)
{
	"clean"
	{
		Wrap-Target -targetFunction $function:Clean
	}
	"rebuild"
	{
		Write-Target($Verb)
		Clean
		Build
		Write-Completed($Verb)
	}
	"pack"
	{
		Wrap-Target -targetFunction $function:Pack
	}
	default
	{
		if ( $Verb )
		{ Write-Host ( $Verb + " is not a valid target") }
		else
		{
			$Verb = "Build"
			Wrap-Target -targetFunction $function:Build
			if ( !($NoPack) )
			{
				$Verb = "Pack"
				Wrap-Target -targetFunction $function:Pack
			}
		}
	}
}
