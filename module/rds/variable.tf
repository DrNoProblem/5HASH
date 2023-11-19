variable "storage" {
  description = "Storage RDS"
  type = number
}

variable "dbname" {
  description = "database name"
  type = string
}

variable "engine" {
  description = "database engine"
  type = string
}

variable "version" {
  description = "database engine version"
  type = string
}

variable "rds_instance" {
  description = "RDS instance"
  type = string
}

variable "username" {
  description = "database username"
  type = string
}

variable "password" {
  description = "database password"
  type = string
}

variable "group_name" {
  description = "Parameter group name"
  type = string
}
