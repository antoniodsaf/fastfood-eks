data "aws_secretsmanager_secret_version" "fastfood_credentials" {
  secret_id = var.fastfood_credentials_arn
}

provider "kubernetes" {  
  host                   = data.aws_eks_cluster.eks-cluster.endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.eks-cluster.certificate_authority[0].data)
  exec {
    api_version = "client.authentication.k8s.io/v1beta1"
    args        = ["eks", "get-token", "--cluster-name", var.cluster_name]
    command     = "aws"
  }
}

resource "kubernetes_secret" "fastfood_secret" {
  metadata {
    name = "fastfood-secret"
  }
  data = {
    DATABASE_HOST = jsondecode(data.aws_secretsmanager_secret_version.fastfood_credentials.secret_string)["DATABASE_HOST"]
    DATABASE_PORT = jsondecode(data.aws_secretsmanager_secret_version.fastfood_credentials.secret_string)["DATABASE_PORT"]
    DATABASE_USER = jsondecode(data.aws_secretsmanager_secret_version.fastfood_credentials.secret_string)["DATABASE_USER"]
    DATABASE_PASS = jsondecode(data.aws_secretsmanager_secret_version.fastfood_credentials.secret_string)["DATABASE_PASS"]
    DATABASE_NAME = jsondecode(data.aws_secretsmanager_secret_version.fastfood_credentials.secret_string)["DATABASE_NAME"]
  }
  type = "literals"
}

