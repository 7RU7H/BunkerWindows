# Import the PowerUp module
Import-Module PowerUp

# Use the Check-Permissions function from PowerUp to check for insecure file and directory permissions
$insecurePermissions = Check-Permissions

# If any insecure permissions are found, generate a remediation script to fix the issues
if ($insecurePermissions) {
    # Set the output file path for the remediation script
    $outputFile = "C:\Temp\remediation.ps1"

    # Initialize an empty array to store the remediation commands
    $commands = @()

    # Iterate through the insecure permissions
    foreach ($permission in $insecurePermissions) {
        # Extract the path and account from the permission object
        $path = $permission.Path
        $account = $permission.Account

        # Add a command to the array to grant the "Modify" permission to the account for the path
        $commands += "icacls $path /grant $account:(OI)(CI)M"
    }

    # Join the commands into a single string and save them to the output file
    $commands -join "`n" | Out-File $outputFile

    # Display a message to inform the user that the remediation script has been generated
    "Remediation script generated at $outputFile. Please review and run the script to fix any insecure permissions."
} else {
    # If no insecure permissions are found, display a message to inform the user
    "No insecure permissions found."
}
