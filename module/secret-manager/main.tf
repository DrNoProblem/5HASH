resource "aws_secretsmanager_secret" "example_secret" {
  name = var.secret_manager_name
  description = ""
}

resource "aws_secretsmanager_secret_version" "example_secret_version" {
  secret_id     = aws_secretsmanager_secret.example_secret.id
  secret_string = "the_secret_value"

}

/* 

Ce fichier utilise deux ressources Terraform pour créer un secret dans AWS Secrets Manager :

aws_secretsmanager_secret : Cette ressource définit un nouveau secret dans AWS Secrets Manager avec le nom spécifié et une éventuelle description. 
Il s'agit de la définition du secret lui-même.

aws_secretsmanager_secret_version : Cette ressource crée une nouvelle version du secret avec une valeur spécifique. Vous pouvez spécifier le secret à l'aide de secret_string ou 
secret_binary pour stocker des données binaires.

Assurez-vous de remplacer "votre_region_aws" par la région AWS dans laquelle vous souhaitez créer le secret, "example-secret" par le nom de votre secret, et "votre_secret_value" 
par la valeur réelle que vous souhaitez stocker.

N'oubliez pas que la gestion des secrets est sensible, veillez à utiliser les meilleures pratiques de sécurité pour stocker, accéder et gérer ces informations sensibles.

 */