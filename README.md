## What's in this repo?
Terraform configuration files to provision infrastructure on AWS.

## What is terraform? 

Terraform in simple words, is a tool to provision infrastructure on AWS with code. It's similar to Cloudformation.\
Check this getting started guide I made to learn more about Terraform and quickly get started. [Click here](https://github.com/ravsau/aws-labs/blob/master/terraform-aws/terraform-ec2.MD)




### If you plan to push your terraform configurations to git. Make sure to add this to ~/.gitignore  , which will mean  tfstate files and other terraform config files(.terraform directories) are not commited to git.
```vi
# Local .terraform directories
**/.terraform/*

# .tfstate files
*.tfstate
*.tfstate.* 
```



More Reference: https://www.terraform.io/docs/providers/aws/index.html
