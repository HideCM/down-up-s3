$endpoint = "https://72728hanfhyaj.r2.cloudflarestorage.com" #change your enpoint url
$profile = "R2" #you can change it to other profile
$destination = "F:\BackupVVV"

# Read the list.txt
Get-Content list.txt | ForEach-Object {
    $source = "s3://my-bucket/$_" #change my-bucket to your bucket name
    $target = Join-Path $destination $_
    
    # Create folder
    New-Item -ItemType Directory -Force -Path $target | Out-Null
    
    # Download from S3
    aws s3 cp $source $target --recursive --profile $profile --endpoint-url $endpoint
}
