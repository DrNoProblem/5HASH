provider "aws" {
  region = "eu-west-3"
}


module "cloud-watch" {
  source = "./module/cloud-watch"
}

module "ec2" {
  source = "./module/ec2"
}

module "elb" {
  source = "./module/elb"
}

module "rds" {
  source = "./module/rds"
}

module "secret-manager" {
  source = "./module/secret-manager"
}

module "security-group" {
  source = "./module/security-group"
}

module "ssh" {
  source = "./module/ssh"
}

module "vpc" {
  source = "./module/vpc"
}









#Creation des associations nécessaires
resource "aws_eip_association" "eip_assoc" {
  instance_id   = module.ec2.output_ec2_id
  allocation_id = module.eip.output_eip_id
}

resource "aws_volume_attachment" "ebs_att" {
  device_name = "/dev/sdh"
  volume_id   = module.ebs.output_id_volume
  instance_id = module.ec2.output_ec2_id
}