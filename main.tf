resource "random_pet" "random" {
  length = 2
}

resource "aws_db_instance" "education" {
  identifier             = "${var.db_name}-${random_pet.random.id}"
  instance_class         = var.db_instance_class
  allocated_storage      = 5
  engine                 = "postgres"
  engine_version         = "14.1"
  username               = var.db_username
  password               = var.db_password
  skip_final_snapshot    = true
}

variable "db_name" {
  description = "Unique name to assign to RDS instance"
  default     = "t101"
}

variable "db_instance_class" {
  type        = string
  description = "The type of database instance to create"
  default     = "db.t2.micro"
}

variable "db_username" {
  description = "Username for the database instance"
  default     = "admin"
}

variable "db_password" {
  description = "Password for the database instance"
  default     = "yourpassword"
}
