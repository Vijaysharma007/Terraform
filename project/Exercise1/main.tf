    terraform {
    required_providers {
        aws = {
        source  = "hashicorp/aws"
        version = "~> 4.0"
        }
    }
    }

    provider "aws" {
        region     = "ap-south-1"
    }


    resource "aws_vpc" "main" {
    cidr_block = "10.0.0.0/16"

    tags = {
        Name = "terraform-vpc"
        environment = "dev"
    }
    }

    resource "aws_internet_gateway" "igw" {
    vpc_id = aws_vpc.main.id

    tags = {
        Name = "terraform-igw"
        environment = "dev"
    }
    }

    resource "aws_subnet" "subnet" {
    vpc_id            = aws_vpc.main.id
    cidr_block        = "10.0.1.0/24"
    availability_zone = "ap-south-1a"
    map_public_ip_on_launch = true
        tags = {
            Name = "terraform-subnet"
            environment = "dev"
        }
    }

    resource "aws_route_table" "public_rt" {
    vpc_id = aws_vpc.main.id

        tags = {
            Name = "public-route-table"
            environment = "dev"
        }
    }

    resource "aws_route" "internet_route" {
    route_table_id         = aws_route_table.public_rt.id
    destination_cidr_block = "0.0.0.0/0"
    gateway_id             = aws_internet_gateway.igw.id
    }

    resource "aws_route_table_association" "public_assoc"{
        subnet_id      = aws_subnet.subnet.id
        route_table_id = aws_route_table.public_rt.id
    }

    resource "aws_security_group" "web_sg" {
    name        = "web-sg"
    description = "Allow HTTP and SSH traffic"
    vpc_id      = aws_vpc.main.id

    ingress {
        from_port   = 80
        to_port     = 80
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

        tags = {
            Name = "web-sg"
            environment = "dev"
        }
    }

    resource "aws_instance" "web"{
        ami = "ami-01a00762f46d584a1"
        instance_type = "t2.micro"
        associate_public_ip_address = true
        subnet_id = aws_subnet.subnet.id
        vpc_security_group_ids = [aws_security_group.web_sg.id]
    }
