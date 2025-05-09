provider "aws" {
region = "us-east-1"
}

resource "aws_instance" "one" {
count = 4
ami = "ami-085386e29e44dacd7"
instance_type = "t2.medium"
key_name = "jenkins"
vpc_security_group_ids = ["sg-0b07222d39984d67c"]
tags = {
Name = var.instance_names[count.index]
}
}

variable "instance_names" {
default = ["jenkins", "application-1", "application-2", "Monitoring server"]
}
