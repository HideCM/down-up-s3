# R2 to Local Backup Script

This PowerShell script allows you to download directories from **R2 Cloudflare Object Storage** (or **Backblade B2** ...) to a local destination. It uses `AWS CLI` to manage the file transfer process.

## Features
- Reads a list of directories from a text file.
- Creates the target folder structure locally if it doesn't already exist.
- Downloads files and folders recursively from R2, B2, S3 to the specified destination.

---

## Prerequisites
1. **Install AWS CLI**:
   - Download and install from the [AWS CLI official page](https://aws.amazon.com/cli/).

2. **Configure your R2 Cloudflare Storage profile in AWS CLI**:
```powershell
   aws configure --profile R2
```

-   **Access Key ID**: Your R2 Access Key ID.
-   **Secret Access Key**: Your R2 Secret Access Key.
-   **Default region**: Leave this blank or set it to your preferred region.
-   Add the AWS endpoint:
```powershell
aws configure set profile.R2.s3.endpoint_url https://<your-r2-endpoint>.cloudflarestorage.com
```
3. **Create a text file `list.txt`**:

-   Save this file in the same folder as the script.
-   Add the paths of the directories you want to download. Each directory path should be on a new line:

```bash
path/path/folder1
path/path/folder2
```
## Usage

1.  Clone this repository or download the script file.
2.  Place the `list.txt` file in the same folder as the script.
3.  Open PowerShell and navigate to the folder containing the script.
4.  Modify the following variables in the script as needed:
    -   `$endpoint`: Set it to your R2, S3, B2 endpoint URL.
    -   `$profile`: The AWS CLI profile configured for R2, S3, B2.
    -   `$destination`: The local folder where files will be downloaded.
```powershell
.\download-file-R2.ps1
```
## How It Works

1.  The script reads each line from `list.txt`.
2.  For each directory:
    -   The corresponding local folder is created if it doesn't exist.
    -   Files and subfolders are downloaded recursively using the `aws s3 cp` command.
3.  Download progress and logs are displayed in the console.

## Example Output

- If the `list.txt` file contains:
```bash
path/path/folder1
path/path/folder2
```
- And the script is executed with:
```powershell
$destination = "F:\BackupVVV"
```
- The resulting local folder structure will be:
```makefile
F:\BackupVVV\path\path\folder1
F:\BackupVVV\path\path\folder2
```
## Troubleshooting

-   **Script execution policy error**: If PowerShell blocks script execution, run this command before running the script:
```powershell
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
```
-   **AWS CLI errors**: Verify your AWS CLI configuration and ensure the `R2` profile is set up correctly.
-   **Endpoint errors**: Double-check the endpoint URL in the `$endpoint` variable.
