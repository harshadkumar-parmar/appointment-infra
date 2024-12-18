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

variable "ecr_repository_url" {
  description = "The URL of the ECR repository"
  type        = string
}

variable "environment" {
  description = "Environment variables for the container"
  type        = list(object({
    name = string
    value = string
  }))
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

variable "subnet_ids" {
  description = "The IDs of the subnets for the ECS service"
  type        = list(string)
}

variable "vpc_id" {
  description = "The ID of the VPC"
  type        = string
}

variable "target_group_arn" {
  description = "The ARN of the target group"
  type        = string
}

variable "db_username_secret_arn" {
  description = "The ARN of the secret containing the database username"
  type        = string
}

variable "db_password_secret_arn" {
  description = "The ARN of the secret containing the database password"
  type        = string
}

variable "db_secrets_arn" {
  description = "The ARN of the secret containing the database credentials"
  type        = string
}
