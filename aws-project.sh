#!/bin/bash 


#############################
set -x



# im list out aws s3 buckets
echo "this is listing out the s3 busket informaction"
aws s3 ls
# im listing the ec2 instance info
echo "this is will show only instance id"
aws ec2 describe-instances --query "Reservations[*].Instances[*].InstanceId"
# I need to desplay iam user list
echo "this will show iam list of users informaction"
aws iam list-users # This command will show total json lang"
echo "this will show only the specif user nams of ima"
aws iam list-users --query "Users[*].UserName" # This will show only the username of the IAM

