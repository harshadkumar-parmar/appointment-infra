variable "cidr_block" {
  description = "The CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidrs" {
  description = "The CIDR blocks for the public subnets"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "availability_zones" {
  description = "The availability zones for the subnets"
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b"]
}

variable "repository_name" {
  description = "The name of the ECR repository"
  type        = string
  default     = "appointment-app-repo"
}

variable "image_tag_mutability" {
  description = "The tag mutability setting for the repository"
  type        = string
  default     = "MUTABLE"
}

variable "tags" {
  description = "Tags to apply to the resources"
  type        = map(string)
  default     = {}
}

variable "lb_name" {
  description = "The name of the load balancer"
  type        = string
  default     = "appointment"
}

variable "cluster_name" {
  description = "The name of the ECS cluster"
  type        = string
  default     = "appointment-cluster"
}

variable "task_family" {
  description = "The family name of the ECS task definition"
  type        = string
  default     = "appointment-task"
}

variable "task_cpu" {
  description = "The amount of CPU to allocate to the ECS task"
  type        = string
  default     = "256"
}

variable "task_memory" {
  description = "The amount of memory to allocate to the ECS task"
  type        = string
  default     = "512"
}

variable "container_name" {
  description = "The name of the container"
  type        = string
  default     = "appointment-container"
}

variable "container_port" {
  description = "The port the container will listen on"
  type        = number
  default     = 3000
}

variable "environment" {
  description = "Environment variables for the container"
  type        = list(object({
    name = string
    value = string
  }))
  default     = [ {
    name = "environment"
    value = "production"
  } ]
}

variable "region" {
  description = "The AWS region"
  type        = string
  default     = "us-east-1"
}

variable "service_name" {
  description = "The name of the ECS service"
  type        = string
  default     = "appointment-service"
}

variable "desired_count" {
  description = "The desired number of ECS tasks"
  type        = number
  default     = 1
}

variable "db_subnet_group_name" {
  description = "Name of the DB subnet group"
  type        = string
  default     = "rds-subnet-group"
}

variable "db_identifier" {
  description = "Identifier for the RDS instance"
  type        = string
  default     = "appointment-db"
}

variable "db_instance_class" {
  description = "Class of the RDS instance"
  type        = string
  default     = "db.t3.micro"
}

variable "db_allocated_storage" {
  description = "Allocated storage for the RDS instance in GB"
  type        = number
  default     = 20
}

variable "db_engine" {
  description = "Database engine for the RDS instance"
  type        = string
  default     = "postgres"
}

variable "db_engine_version" {
  description = "Engine version for the RDS instance"
  type        = string
  default     = "16.3"
}

variable "db_username" {
  description = "Master username for the RDS instance"
  type        = string
  sensitive   = true
  default     = "postgres"
}

variable "db_password" {
  description = "Master password for the RDS instance"
  type        = string
  sensitive   = true
}

variable "db_name" {
  description = "Name of the database to create"
  type        = string
  default     = "appointment"
}

variable "db_family" {
  description = "The family of the DB engine"
  type        = string
  default     = "postgres16" 
}

variable "db_port" {
  description = "Database port number"
  type        = number
  default     = 5432
}

variable "allow_cidr_blocks" {
  description = "List of CIDR blocks allowed to access the resource"
  type        = list(string)
  default     = ["0.0.0.0/0"]  # Example CIDR block
}

variable "secret_name" {
  description = "Name of the secret"
  type        = string
  default     = "appointment-db-credentials"
}