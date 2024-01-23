variable "naming_prefix" {
    default = "test"
}

variable "env" {
    default = "dev"
}

variable "vpc_cidr" {
    default = "10.0.0.0/16"
}

variable "public_subnet_cidrs" {
    default = [
        "10.0.1.0/24",
        "10.0.2.0/24",
    ]
}

variable "private_subnet_cidrs" {
    default = [
        "10.0.11.0/24",
        "10.0.22.0/24",
    ]
}

variable "vpc_module_version" {
    default = "2024.01.23 Tuesday"

    validation {
        condition     = var.vpc_module_version == "2024.01.23 Tuesday"
        error_message = "Cannot override the default value."
    }
}