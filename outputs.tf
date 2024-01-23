output "vpc_id" {
    value = aws_vpc.main.id
}

output "vpc_cidr" {
    value = aws_vpc.main.cidr_block
}

output "private_subnet_ids" {
    value = aws_subnet.private_subnets[*].id
}

output "vpc_module_version" {
    value = var.vpc_module_version
}