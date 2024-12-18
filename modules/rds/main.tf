resource "aws_db_subnet_group" "this" {
  name       = var.db_subnet_group_name
  subnet_ids = var.subnet_ids

  tags = var.tags
}


resource "aws_db_parameter_group" "custom" {
  name        = "custom-parameter-group"
  family      = var.db_family
  description = "Custom parameter group with SSL disabled"

  parameter {
    name  = "rds.force_ssl"
    value = "0"
  }
}

resource "aws_db_instance" "this" {
  identifier               = var.db_identifier
  instance_class           = var.db_instance_class
  allocated_storage        = var.db_allocated_storage
  engine                   = var.db_engine
  engine_version           = var.db_engine_version
  username                 = var.db_username
  password                 = var.db_password
  db_name                  = var.db_name
  parameter_group_name     = aws_db_parameter_group.custom.name
  skip_final_snapshot      = true
  vpc_security_group_ids   = [aws_security_group.this.id]
  db_subnet_group_name     = aws_db_subnet_group.this.name
  multi_az                 = false
  publicly_accessible      = false
  storage_encrypted        = true
  copy_tags_to_snapshot    = true

  tags = var.tags
}

resource "aws_security_group" "this" {
  vpc_id = var.vpc_id

  ingress {
    from_port   = var.db_port
    to_port     = var.db_port
    protocol    = "tcp"
    cidr_blocks = var.allow_cidr_blocks
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = var.tags
}
