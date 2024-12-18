variable "db_subnet_group_name" {
  description = "The name of the DB subnet group"
  type        = string
  default     = "rds-subnet-group"
}

variable "db_identifier" {
  description = "The identifier for the RDS instance"
  type        = string
  default     = "appointment-db"
}

variable "db_instance_class" {
  description = "The instance class for the RDS instance"
  type        = string
  default     = "db.t3.micro"
}

variable "db_allocated_storage" {
  description = "The allocated storage for the RDS instance"
  type        = number
  default     = 20
}

variable "db_engine" {
  description = "The database engine"
  type        = string
  default     = "mysql"
}

variable "db_engine_version" {
  description = "The engine version"
  type        = string
  default     = "8.0"
}

variable "db_username" {
  description = "The master username for the RDS instance"
  type        = string
  default     = "admin"
}

variable "db_password" {
  description = "The master password for the RDS instance"
  type        = string
}

variable "db_name" {
  description = "The database name"
  type        = string
  default     = "appointmentdb"
}

variable "db_family" {
  description = "The database family"
  type        = string
  default     = "mysql8.0"
}

variable "vpc_id" {
  description = "The VPC ID"
  type        = string
}

variable "subnet_ids" {
  description = "The subnet IDs"
  type        = list(string)
}

variable "db_port" {
  description = "The database port"
  type        = number
  default     = 3306
}

variable "allow_cidr_blocks" {
  description = "The CIDR blocks to allow access"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
  default     = {}
}
