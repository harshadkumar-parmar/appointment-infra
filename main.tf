provider "aws" {
  region = "us-east-1"
}

terraform {
  backend "s3" {
    bucket         = "terraform-state-424726459433"
    key            = "terraform/states/terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "terraform-lock-table"
    encrypt        = true
  }
}

module "vpc" {
  source               = "./modules/vpc"
  cidr_block           = var.cidr_block
  public_subnet_cidrs  = var.public_subnet_cidrs
  availability_zones   = var.availability_zones
  tags                 = var.tags
}

module "ecr" {
  source               = "./modules/ecr"
  repository_name      = var.repository_name
  image_tag_mutability = var.image_tag_mutability
  tags                 = var.tags
}

module "load_balancer" {
  source      = "./modules/load_balancer"
  lb_name     = var.lb_name
  vpc_id      = module.vpc.vpc_id
  subnet_ids  = module.vpc.public_subnet_ids
}

module "rds" {
  source                  = "./modules/rds"
  db_subnet_group_name    = var.db_subnet_group_name
  db_identifier           = var.db_identifier
  db_instance_class       = var.db_instance_class
  db_allocated_storage    = var.db_allocated_storage
  db_engine               = var.db_engine
  db_engine_version       = var.db_engine_version
  db_username             = var.db_username
  db_password             = var.db_password
  db_name                 = var.db_name
  vpc_id                  = module.vpc.vpc_id
  subnet_ids              = module.vpc.public_subnet_ids
  db_port                 = var.db_port
  allow_cidr_blocks       = var.allow_cidr_blocks
  tags                    = var.tags
  db_family               = var.db_family
}

module "secret_manager" {
  source           = "./modules/secret_manager"
  secret_name      = var.secret_name
  db_username      = module.rds.db_username
  db_password      = var.db_password
  db_engine        = module.rds.db_engine
  db_endpoint      = module.rds.db_endpoint
  db_name          = module.rds.db_name
}

module "ecs" {
  source              = "./modules/ecs"
  cluster_name        = var.cluster_name
  task_family         = var.task_family
  task_cpu            = var.task_cpu
  task_memory         = var.task_memory
  container_name      = var.container_name
  container_port      = var.container_port
  ecr_repository_url  = module.ecr.repository_url
  environment         = var.environment
  region              = var.region
  service_name        = var.service_name
  desired_count       = var.desired_count
  subnet_ids          = module.vpc.public_subnet_ids
  vpc_id              = module.vpc.vpc_id
  target_group_arn    = module.load_balancer.target_group_arn
  db_username_secret_arn = module.secret_manager.secret_arn
  db_password_secret_arn = module.secret_manager.secret_arn
  db_secrets_arn = module.secret_manager.secret_arn
}
