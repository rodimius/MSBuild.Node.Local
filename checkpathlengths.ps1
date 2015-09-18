$current_path_length = $PSScriptRoot.length
$longest_paths = cmd /c dir /s /b | sort-object length -descending | Select-Object -first 5

foreach ($path in $longest_paths)
{
	write-host $path
	write-host ($path.length - $current_path_length)
}
