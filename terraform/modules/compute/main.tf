data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-*-x86_64"]
  }
}

resource "aws_instance" "app" {
  ami                    = data.aws_ami.amazon_linux.id
  instance_type          = "t3.micro"
  subnet_id              = var.public_subnet_1_id
  vpc_security_group_ids = [var.web_sg_id]

  key_name = "cloud-key"

  tags = {
    Name = "cloud-dev-app-ec2"
  }
}