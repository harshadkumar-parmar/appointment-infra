output "db_endpoint" {
  description = "The endpoint of the RDS instance"
  value       = aws_db_instance.this.endpoint
}

output "db_username" {
  description = "The master username for the RDS instance"
  value       = aws_db_instance.this.username
}

output "db_name" {
  description = "The database name"
  value       = aws_db_instance.this.db_name
}

output "db_engine" {
  description = "The database engine"
  value       = aws_db_instance.this.engine
}
