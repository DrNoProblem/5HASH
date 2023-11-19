provider "aws" {
  region = "eu-west-3"
}


# Création du sg
module "ec2" {
  source = "./module/ec2"
}

# Création du sg
module "cloud-watch" {
  source = "./module/cloud-watch"
}

# Création du sg
module "elb" {
  source = "./module/elb"
}

# Création du sg
module "rds" {
  source = "./module/rds"
}

# Création du sg
module "secret-manager" {
  source = "./module/secret-manager"
}

# Création du sg
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