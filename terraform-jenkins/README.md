# Provisioning a Jenkins Server on AWS with Terraform

#### Here is the architecture diagram for what this Terraform project creates
![Custom VPC architecture for AWS](https://cdn-images-1.medium.com/max/800/1*o8O9e6Q1Rd-pG3qmnC4o_w.png)

## Prerequisites
- [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html) installed and configuration
- [Terraform](https://www.terraform.io/downloads) installed

# Instructions

### Clone the repo
Run: `git clone https://github.com/dispact/terraform-jenkins.git`

### Create a Secrets file
Create a file called **secrets.tfvars** and populate it with: `my_ip="0.0.0.0"` with 0.0.0.0 being your IP address

### Create a Key Pair
`ssh-keygen -t rsa -b 4096 -m pem -f ltech && mv ltech.pub modules/compute/ltech.pub && mv ltech ltech.pem && chmod 400 ltech.pem`

### Run Terraform
- Initialize terrafom: `terraform init`
- Run: `terraform apply -var-file="secrets.tfvars"`
- When prompted, enter: `yes`

### To SSH into the Jenkins Server
`ssh -i ltech.pem ubuntu@$(terraform output -raw jenkins_public_ip)`

### To destroy everything Terraform built
`terraform destroy -var-file="secrets.tfvars"`

