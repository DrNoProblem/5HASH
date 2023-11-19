resource "aws_cloudwatch_metric_alarm" "example_alarm" {
  alarm_name          = "example-alarm"     # Nom de l'alarme
  comparison_operator = "GreaterThanOrEqualToThreshold"  # Opérateur de comparaison
  evaluation_periods  = 2                   # Périodes d'évaluation
  metric_name         = "CPUUtilization"    # Nom de la métrique à surveiller
  namespace           = "AWS/EC2"          # Namespace de la métrique
  period              = 300                 # Période de la métrique en secondes (5 minutes)
  statistic           = "Average"           # Statistique de la métrique (Average, Sum, etc.)
  threshold           = 70                  # Seuil de déclenchement de l'alarme
  treat_missing_data  = "missing"           # Gestion des données manquantes

  dimensions = {
    InstanceId = "i-xxxxxxxxxxxxxxx"       # Dimensions de la métrique (dans cet exemple, l'ID de l'instance EC2)
  }

  alarm_description = "Alarme déclenchée si la CPU est supérieure à 70% pendant 2 périodes de 5 minutes."
}


/*  

Ce fichier utilise la ressource Terraform aws_cloudwatch_metric_alarm pour créer une alarme CloudWatch dans AWS. Assurez-vous de remplacer "votre_region_aws" par la région AWS 
dans laquelle vous souhaitez créer l'alarme, "example-alarm" par le nom souhaité pour l'alarme, et "i-xxxxxxxxxxxxxxx" par l'ID réel de l'instance EC2 que vous souhaitez surveiller.

Cet exemple crée une alarme qui surveille la métrique de l'utilisation du CPU (CPUUtilization) d'une instance EC2 spécifique et déclenche l'alarme si cette métrique dépasse 70% 
pendant au moins deux périodes de 5 minutes chacune.

Vous pouvez étendre cette configuration pour surveiller d'autres métriques et prendre des actions spécifiques lorsqu'une alarme est déclenchée, comme l'envoi de notifications ou 
l'exécution de certains événements.

*/