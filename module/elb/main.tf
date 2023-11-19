provider "aws" {
  region = "votre_region_aws"
  # Autres configurations du fournisseur AWS
}

resource "aws_lb" "example_elb" {
  name               = "example-elb"       # Nom de l'équilibreur de charge
  internal           = false               # Si true, l'équilibreur de charge sera interne (VPC interne)
  load_balancer_type = "application"       # Type d'équilibreur de charge (application, network, gateway)

  enable_deletion_protection = false      # Désactive la protection contre la suppression

  subnets = [aws_subnet.example_subnet.id]  # Liste des sous-réseaux où l'équilibreur de charge sera créé

  enable_http2       = true                # Active le support HTTP/2
  idle_timeout       = 60                  # Durée d'inactivité en secondes

  enable_cross_zone_load_balancing = true  # Active l'équilibrage de charge entre plusieurs zones de disponibilité

  enable_deletion_protection = false       # Désactive la protection contre la suppression

  tags = {
    Name = "ExampleELB"                   # Tags pour identifier l'équilibreur de charge
  }
}

resource "aws_lb_target_group" "example_target_group" {
  name     = "example-target-group"       # Nom du groupe de cibles
  port     = 80                            # Port pour les cibles du groupe
  protocol = "HTTP"                        # Protocole pour les cibles du groupe
  vpc_id   = aws_vpc.example_vpc.id        # ID du VPC

  health_check {
    path     = "/"                         # Chemin de l'URL de vérification de la santé
    protocol = "HTTP"                      # Protocole de la vérification de la santé
    port     = "traffic-port"              # Port de la vérification de la santé
  }
}

resource "aws_lb_listener" "example_listener" {
  load_balancer_arn = aws_lb.example_elb.arn
  port              = 80                    # Port d'écoute de l'équilibreur de charge
  protocol          = "HTTP"                # Protocole d'écoute de l'équilibreur de charge

  default_action {
    target_group_arn = aws_lb_target_group.example_target_group.arn
    type             = "forward"
  }
}


/* 

Ce fichier utilise plusieurs ressources Terraform pour créer un équilibreur de charge (ELB) dans AWS, y compris un groupe de cibles (target group) et un écouteur (listener). 
Assurez-vous de remplacer les valeurs telles que "votre_region_aws", "example-elb", "example-target-group", etc., par celles qui conviennent à votre configuration.

Cet exemple crée un ELB de type application, configure un groupe de cibles et un écouteur HTTP sur le port 80. N'oubliez pas d'ajuster la configuration en fonction de vos besoins spécifiques, 
comme le protocole, le port, le chemin de vérification de la santé, etc.

*/