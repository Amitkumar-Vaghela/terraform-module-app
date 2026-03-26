# Terraform Modular Infrastructure

## Overview

This project demonstrates a modular Terraform setup to provision AWS infrastructure across multiple environments (dev, stg, prd).

## Architecture

* EC2 Instances
* S3 Bucket (for infrastructure storage)
* DynamoDB (for state locking)
* Default VPC with Security Group

## 3D Architecture Diagram

```
                        +---------------------------+
                        |        AWS Cloud          |
                        |   Region: ap-south-1      |
                        +-------------+-------------+
                                      |
        ---------------------------------------------------------
        |                        |                        |
   +---------+              +---------+              +---------+
   |  DEV    |              |  STG    |              |  PRD    |
   | Env     |              | Env     |              | Env     |
   +----+----+              +----+----+              +----+----+
        |                        |                        |
   +----v----+              +----v----+              +----v----+
   |  EC2    |              |  EC2    |              |  EC2    |
   | t2.micro|              | t2.micro|              | t2.micro|
   +----+----+              +----+----+              +----+----+
        |                        |                        |
        ------------------ Shared Resources ------------------
                              |
                +-------------+-------------+
                |                           |
        +-------v-------+           +-------v-------+
        |     S3        |           |  DynamoDB     |
        | Infra Bucket  |           | State Locking |
        +---------------+           +---------------+

                +-------------------------------+
                |        Default VPC            |
                |  Security Group (SSH/HTTP)   |
                +-------------------------------+
```

## Project Structure

```
terraform-module-app/
│
├── main.tf
├── providers.tf
├── terraform.tf
├── .gitignore
│
└── infra-app/
    ├── ec2.tf
    ├── variables.tf
    ├── s3.tf
    └── dynamodb.tf
```

## Usage

```bash
terraform init
terraform plan
terraform apply
```

## Environments

* dev
* stg
* prd

## Best Practices

* Sensitive files excluded using `.gitignore`
* Modular design for reusability
* Environment-based configuration

## Future Improvements

* Add Application Load Balancer (ALB)
* Implement Auto Scaling Group (ASG)
* Configure remote backend (S3 + DynamoDB)
* Add CI/CD using GitHub Actions

---

Author: Amit Vaghela
