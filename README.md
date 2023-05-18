# Synch AWS S3 and local system

## Instalation

Create S3 bucket and also AWS CLI Access Key and Secret for S3 using IAM, a sample policy config that can be used is:

```json
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "s3:*",
                "s3-object-lambda:*"
            ],
            "Resource": [
                "arn:aws:s3:::your-bucket-name",
                "arn:aws:s3:::your-bucket-name/*"
            ]
        },
        {
            "Effect": "Deny",
            "NotAction": [
                "s3:*",
                "s3-object-lambda:*"
            ],
            "NotResource": [
                "arn:aws:s3:::your-bucket-name",
                "arn:aws:s3:::your-bucket-name/*"
            ]
        }
    ]
}
```

Schedule the batch file using Windows Task Scheduler by:
- Open Task Scheduler and create new task.
- In General tab, chose a name and set 'Run wether user is logged in or not', and 'Do not store password'
- In Actions tab, Add an action to run a program and select this script
- In Triggers tab, Add a trigger to add a daily trigger and set repeat to a desirable option

## Flags

- Use `--help` to show a help text.
- Use `--delete` to force old files stored in S3 to be erased after deleting them locally.
