resource "aws_db_instance" "default" {
  allocated_storage    = var.storage
  db_name              = var.dbname
  engine               = var.engine
  engine_version       = var.version
  instance_class       = var.rds_instance
  username             = var.username
  password             = var.password
  parameter_group_name = var.group_name
  skip_final_snapshot  = true
}