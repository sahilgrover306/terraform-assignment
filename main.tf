terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "sahil-grover"

    workspaces {
      name = "myworkspace"
    }
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.13.0"
    }
  }
}

provider "aws" {
  shared_credentials_files = ["C:/Users/shall/Documents/tf-learn/.aws/credentials"]
  profile                  = "default"
}

#####################################
data "aws_eks_cluster" "cluster" {
  name = module.eks.cluster_id
}

data "aws_eks_cluster_auth" "cluster" {
  name = module.eks.cluster_id
}

data "aws_availability_zones" "available" {}
