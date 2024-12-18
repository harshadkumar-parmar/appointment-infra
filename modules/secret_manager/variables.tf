variable "secret_name" {
  description = "The name of the secret"
  type        = string
  default     = "appointment-db-credentials"
}

variable "db_username" {
  description = "The master username for the RDS instance"
  type        = string
}

variable "db_password" {
  description = "The master password for the RDS instance"
  type        = string
}

variable "db_engine" {
  description = "The database engine"
  type        = string
}

variable "db_endpoint" {
  description = "The endpoint of the RDS instance"
  type        = string
}

variable "db_name" {
  description = "The database name"
  type        = string
}
