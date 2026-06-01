variable "private_subnet_1_id" {}

variable "private_subnet_2_id" {}

variable "db_sg_id" {}

variable "db_password" {
  sensitive = true
}