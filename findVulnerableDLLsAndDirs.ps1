# Set the root directory to search for DLLs
$rootDirectory = "C:\"

# Get a list of all DLLs in the root directory and its subdirectories
$dlls = Get-ChildItem -Path $rootDirectory -Recurse -Include *.dll

# Filter the list of DLLs to include only those that are not located in the system32 directory
$insecureDLLs = $dlls | Where-Object {$_.DirectoryName -notmatch "system32"}

# Iterate through the insecure DLLs
foreach ($dll in $insecureDLLs) {
    # Get the path of the DLL
    $path = $dll.FullName

    # Output the permissions of the DLL
    icacls $path

    # Output the permissions of the directory containing the DLL
    icacls (Split-Path $path)
}

# If no insecure DLLs are found, display a message to inform the user
if ($insecureDLLs.Count -eq 0) {
    "No insecure DLLs found."
}
