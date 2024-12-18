output "vpc_id" {
  description = "The ID of the VPC"
  value       = module.vpc.vpc_id
}

output "public_subnet_ids" {
  description = "The IDs of the public subnets"
  value       = module.vpc.public_subnet_ids
}

output "ecr_repository_url" {
  description = "The URL of the ECR repository"
  value       = module.ecr.repository_url
}

output "load_balancer_dns_name" {
  description = "The DNS name of the load balancer"
  value       = module.load_balancer.load_balancer_dns
}

output "rds_endpoint" {
  description = "The endpoint of the RDS instance"
  value       = module.rds.db_endpoint
}

output "secret_arn" {
  description = "The ARN of the Secrets Manager secret"
  value       = module.secret_manager.secret_arn
}

output "ecs_cluster_arn" {
  description = "The ARN of the ECS cluster"
  value       = module.ecs.ecs_cluster_arn
}

output "ecs_service_name" {
  description = "The ECS service name"
  value       = module.ecs.ecs_service_name
}

output "ecs_task_definition_arn" {
  description = "The ARN of the ECS task definition"
  value       = module.ecs.ecs_task_definition_arn
}
