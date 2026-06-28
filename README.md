# Terraform AWS Learning

## Overview

This repository contains my Terraform learning project where I am learning Infrastructure as Code (IaC) by creating AWS resources from scratch.

The objective is to understand how Terraform works internally instead of simply copying existing code. Each resource is created step by step to understand its purpose, dependencies, and implementation.

---

## What I Learned Today

* Installed Terraform
* Configured AWS CLI credentials
* Understood the purpose of the AWS Provider
* Learned the basic Terraform workflow:

  * `terraform init`
  * `terraform plan`
  * `terraform apply`
  * `terraform destroy`
* Created a custom VPC
* Created an Internet Gateway (IGW)
* Created a Public Subnet
* Created a Route Table
* Added a route (`0.0.0.0/0`) to the Internet Gateway
* Associated the Route Table with the Public Subnet
* Created a Security Group
* Launched an EC2 instance using Terraform
* Learned how Terraform automatically manages resource dependencies using resource references.

---

## Project Structure

```text
terraform-learning/
│
└── main.tf
```

At this stage, all resources are defined in a single `main.tf` file to better understand how Terraform creates and manages AWS infrastructure. The project will be refactored into modules and multiple environments in later lessons.

---

## AWS Resources Created

* VPC
* Internet Gateway
* Public Subnet
* Route Table
* Route Table Association
* Security Group
* EC2 Instance

---

## Infrastructure

```text
Internet
    │
Internet Gateway
    │
Route Table
    │
0.0.0.0/0
    │
Public Subnet
    │
Security Group
    │
EC2 Instance
    │
VPC
```

---

## Terraform Commands Used

Initialize Terraform

```bash
terraform init
```

Review the execution plan

```bash
terraform plan
```

Create infrastructure

```bash
terraform apply
```

Destroy infrastructure

```bash
terraform destroy
```

---

## Next Steps

* Learn Terraform variables
* Split the configuration into multiple files
* Create reusable modules
* Implement remote state using Amazon S3
* Create separate environments (Development, Staging, Production)

---

## Author

**Vijay Sharma**

AWS Cloud Engineer | Learning Terraform through hands-on AWS projects
