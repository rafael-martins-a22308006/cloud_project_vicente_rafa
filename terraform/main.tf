provider "aws" {
  region = "us-east-1"
}

module "networking" {
  source = "./modules/networking"
}

module "compute" {
  source             = "./modules/compute"
  public_subnet_1_id = module.networking.public_subnet_1_id
  web_sg_id          = module.networking.web_sg_id
}

module "database" {
  source              = "./modules/database"
  private_subnet_1_id = module.networking.private_subnet_1_id
  private_subnet_2_id = module.networking.private_subnet_2_id
  db_sg_id            = module.networking.db_sg_id
  db_password         = var.db_password
}

module "queue" {
  source = "./modules/queue"
}
