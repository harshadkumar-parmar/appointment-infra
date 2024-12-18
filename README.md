# Appointment Infrastructure Terraform

## Overview

This repository contains Terraform configurations for provisioning an appointment infrastructure on AWS. It includes modules for Amazon Elastic Container Service (ECS), Elastic Container Registry (ECR), Secrets Manager, Relational Database Service (RDS), and an Application Load Balancer (ALB).

## Prerequisites

- **Terraform**: Version 1.x or higher
- **AWS Account**: Ensure you have an AWS account with the necessary permissions
- **Access Credentials**: Properly configured AWS CLI with access credentials

## Setup

1. **Clone the repository:**
    ```sh
    git clone https://github.com/yourusername/appointment-infra.git
    ```

2. **Navigate to the project directory:**
    ```sh
    cd appointment-infra
    ```

3. **Install Terraform:**
    Follow the instructions on the [Terraform website](https://www.terraform.io/downloads.html) to install the appropriate version for your operating system.

4. **Configure AWS Credentials:**
    Ensure that your AWS CLI is configured with the necessary access credentials. You can configure your credentials by running:
    ```sh
    aws configure
    ```

## Usage

1. **Initialize Terraform:**
    ```sh
    terraform init
    ```

2. **Validate the configuration:**
    ```sh
    terraform validate
    ```

3. **Plan the infrastructure changes:**
    ```sh
    terraform plan
    ```

4. **Apply the configuration:**
    ```sh
    terraform apply
    ```

5. **Destroy the infrastructure (when no longer needed):**
    ```sh
    terraform destroy
    ```

## Directory Structure

```
appointment-infra/
├── modules/
│   ├── ecr/
│   │   └── main.tf
│   │   └── variabes.tf
│   │   └── outputs.tf
│   ├── ecs/
│   │   └── main.tf
│   │   └── variabes.tf
│   │   └── outputs.tf
│   ├── secrets_manager/
│   │   └── main.tf
│   │   └── variabes.tf
│   │   └── outputs.tf
│   ├── rds/
│   │   └── main.tf
│   │   └── variabes.tf
│   │   └── outputs.tf
│   └── load_balancer/
│       └── main.tf
│   │   └── variabes.tf
│   │   └── outputs.tf
├── main.tf
├── variables.tf
├── outputs.tf
└── README.md
```

## Modules

### ECR Module

Manages the creation of an Amazon Elastic Container Registry (ECR) repository.

**Configuration:**
```hcl
module "ecr" {
  source = "./modules/ecr"
  
  # Add your variables here
}
```

### ECS Module

Sets up an Amazon Elastic Container Service (ECS) cluster and service.

**Configuration:**
```hcl
module "ecs" {
  source = "./modules/ecs"
  
  # Add your variables here
}
```

### Secrets Manager Module

Provisions AWS Secrets Manager to securely store and manage secrets.

**Configuration:**
```hcl
module "secrets_manager" {
  source = "./modules/secrets_manager"
  
  # Add your variables here
}
```

### RDS Module

Creates an Amazon Relational Database Service (RDS) instance.

**Configuration:**
```hcl
module "rds" {
  source = "./modules/rds"
  
  # Add your variables here
}
```

### Load Balancer Module

Configures an Application Load Balancer (ALB) for the ECS service.

**Configuration:**
```hcl
module "load_balancer" {
  source = "./modules/load_balancer"
  
  # Add your variables here
}
```
