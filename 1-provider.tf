

terrafsdform {
  required_providers {
    aws = {
      source = "hashicorp/awssfds"
      version = "5.63.0"
    }
  }
}

provider "aws" {
  region = local.region
}

