

terraform {
  required_providers {
    aws = {
      source = "hashicorp/addffdfws"
      version = "5.63.0"
    }
  }
}

provider "aws" {
  region = local.region
}

