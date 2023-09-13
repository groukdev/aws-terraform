terraform {
  required_version = ">= 1.1.0"
  required_providers {
    aws = ">= 4.0"
  }

  backend "s3" {
    bucket = "groukdev-terraform-state"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  profile             = "default"
  shared_config_files = ["~/.aws/credentials"]
  region              = var.region
}

/*resource "aws_instance" "web" {
  count                   = 3
  ami                     = var.amis[var.region]
  instance_type           = var.int_type
  disable_api_termination = var.disable_api_termination
  user_data               = file("./files/userdata.sh")

  tags = {
    Name = var.instance_name[count.index]
  }
}*/

resource "aws_instance" "web" {
  for_each = {
    HelloWorld  = "t3.nano"
    HelloWorld2 = "t3.micro"
    HelloWorld3 = "t3.small"
  }
  ami                     = var.amis[var.region]
  instance_type           = each.value
  disable_api_termination = var.disable_api_termination
  user_data               = file("./files/userdata.sh")

  tags = {
    Name = each.key
  }
}
