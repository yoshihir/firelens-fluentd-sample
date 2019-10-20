provider "aws" {
  region = "ap-northeast-1"
  profile = "staging"
  version = "~> 2.0"
}

terraform {
  required_version = "~> 0.12.0"

  backend "s3" {
    bucket = "firelens-fluentd-terraform-tfstate"
    key = "terraform.tfstate"
    region = "ap-northeast-1"
    profile = "staging"
    encrypt = true
  }
}