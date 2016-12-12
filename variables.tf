# variables.tf

# AWS credentials are sourced from different locations. I'd recommend adding a
# local file terraform.tfvars next to variables.tf, but do NOT check it in. If
# found, Terraform will load that file automatically. Git already ignores it in
# this repo.
#
# Make it look like this, with your credentials and without the leading #'s.
# See https://www.terraform.io/docs/providers/aws/ for more details.
#
# access_key = "your-access-key"
# secret_key = "your-secret-key"
#
variable "access_key" {}
variable "secret_key" {}

variable "region" {
    default = "us-east-1"
}

# AMI IDs are all over the place. In my experience, it's a safe bet going with
# a Ubuntu LTS (long-term stable) release. That said, here are a couple recent
# testing (not LTS) image IDs, along with sample filters to find them.
#
# https://cloud-images.ubuntu.com/locator/daily/
# ami-bcfac8ab = { us-east-1; xenial; amd64; hvm-ssd; 20161125 }
# ami-73208f13 = { us-west-2; xenial; amd64; hvm-ssd; 20161125 }
#
variable "amis" {
    type = "map"
    default = {
        us-east-1 = "ami-bcfac8ab"
        us-west-2 = "ami-73208f13"
    }
}

# The key is a PEM file that you've already uploaded to AWS. Keys are
# per-region, so key 'fubar' in us-east-1 would show up in this list:
#
# https://console.aws.amazon.com/ec2/v2/home?region=us-east-1#KeyPairs:sort=keyName
#
variable "key_name" {
    description = "Name of the SSK key pair to use in AWS"
    default = "hashicorp_2016_11"
}
