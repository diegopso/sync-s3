@echo off
set location=C:\your\path\here
set bucket=your-bucket-name
set f1=%1

if "%f1%" == "--help" GOTO help
if "%f1%" == "-h" GOTO help
goto:main

:help
   echo # Synch AWS S3 and local system.
   echo -----------------------------------------------------
   echo Create S3 bucket and also AWS CLI Access Key and Secret for S3 using IAM
   echo Schedule this BATCH file using Windows Task Scheduler by:
   echo - Open Task Scheduler and create new task.
   echo - In General, set 'Run wether user is logged in or not', and 'Do not store password'.
   echo - In Actions, add an action to run a program and select this script.
   echo - In Triggers, add a daily trigger and set repeat to a desirable option.
   echo .
   echo Run this script on shell using '--delete' to remove deleted files also from s3 and prevent re-downloading them.
goto:eof

:main
    rem if not empty
    dir /A /B %location% | findstr /R ".">NUL && (
        echo Sending local updates
        aws s3 sync %location% s3://%bucket% %f1%
    )

    echo Downloading remote updates
    aws s3 sync s3://%bucket% %location%
goto:eof
