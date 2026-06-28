variable "aws_region" {
  description = "The AWS region to create resources in"
  type        = string
  default     = "ap-south-1"
}

variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  type        = string
}
variable "subnet_cidr" {
  description = "The CIDR block for the subnet"
  type        = string
}

variable "instance_type" {
  description = "The instance type for the EC2 instance"
  type        = string
}

variable "avilability_zone" {
  description = "The availability zone for the subnet"
  type        = string
}

variable "ami_id" {
  description = "The AMI ID for the EC2 instance"
  type        = string
}
