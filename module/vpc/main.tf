resource "aws_vpc" "example_vpc" {
  cidr_block       = "10.0.0.0/16"    # Bloc CIDR du VPC
  instance_tenancy = "default"        # Type de location de l'instance (default ou dedicated)

  tags = {
    Name = "ExampleVPC"               # Tags pour identifier le VPC
    Environment = "Production"
  }
}

resource "aws_subnet" "example_subnet" {
  vpc_id     = aws_vpc.example_vpc.id
  cidr_block = "10.0.1.0/24"          # Bloc CIDR du sous-réseau

  availability_zone = "votre_zone_disponibilite"
  
  tags = {
    Name = "ExampleSubnet"            # Tags pour identifier le sous-réseau
  }
}


/* 


Bien sûr, voici un exemple simple de fichier Terraform (.tf) pour créer un réseau virtuel (VPC) dans AWS :

Ce fichier utilise deux ressources Terraform pour créer un VPC et un sous-réseau dans AWS :

aws_vpc : Cette ressource définit un nouveau VPC avec un bloc CIDR spécifié et une éventuelle option pour l'emplacement de l'instance.
aws_subnet : Cette ressource crée un sous-réseau associé au VPC précédemment créé, avec un bloc CIDR spécifié et une zone de disponibilité définie.
Assurez-vous de remplacer "votre_region_aws" par la région AWS dans laquelle vous souhaitez créer le VPC, "10.0.0.0/16" par le bloc CIDR approprié pour votre VPC, 
"votre_zone_disponibilite" par la zone de disponibilité dans laquelle vous souhaitez créer le sous-réseau.

Ce fichier peut être utilisé avec Terraform pour créer un VPC de base avec un sous-réseau associé dans votre compte AWS. Vous pouvez également ajouter d'autres 
ressources pour étendre votre configuration VPC, comme les groupes de sécurité, les route tables, etc., en fonction de vos besoins spécifiques. 

*/