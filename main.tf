terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      configuration_aliases = [
        aws.root,
      ]
    }
  }
}

data "aws_availability_zones" "available" {
    provider = aws.root
}

resource "aws_vpc" "main" {
    provider = aws.root
    cidr_block = var.vpc_cidr
    tags = {
      Name = "${var.env}-vpc (${var.naming_prefix})"
    }
}

resource "aws_subnet" "private_subnets" {
    provider = aws.root
    count = length(var.private_subnet_cidrs)
    vpc_id = aws_vpc.main.id
    cidr_block = element(var.private_subnet_cidrs, count.index)
    availability_zone = data.aws_availability_zones.available.names[count.index]
    tags = {
      Name = "${var.env}-private-subnet-${count.index + 1}  (${var.naming_prefix})"
    }
}
