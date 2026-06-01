resource "aws_db_subnet_group" "db" {
  name = "cloud-dev-db-subnet-group"

  subnet_ids = [
    var.private_subnet_1_id,
    var.private_subnet_2_id
  ]
}

resource "aws_db_instance" "db" {
  identifier        = "cloud-dev-db"
  engine            = "postgres"
  instance_class    = "db.t3.micro"
  allocated_storage = 20

  db_name  = "appdb"
  username = "adminuser"
  password = var.db_password

  skip_final_snapshot = true
  publicly_accessible = false

  db_subnet_group_name   = aws_db_subnet_group.db.name
  vpc_security_group_ids = [var.db_sg_id]

  tags = {
    Name = "cloud-dev-rds"
  }
}