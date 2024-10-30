variable "region" {
  default = "us-east-1"
}

variable "cluster_name" {
  default = "fastfood-cluster"
}

variable "lab_role" {
  default = "arn:aws:iam::152915761077:role/LabRole"
}

variable "access_config" {
  default = "API_AND_CONFIG_MAP"
}

variable "node_group" {
  default = "fastfood-node-group"
}

variable "instance_type" {
  default = "t2.small"
}

variable "principal_arn" {
  default = "arn:aws:iam::152915761077:role/voclabs"
}

variable "policy_arn" {
  default = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSClusterAdminPolicy"
}

variable "fastfood_credentials_arn" {
    type = string
    default = "arn:aws:secretsmanager:us-east-1:152915761077:secret:fastfood-app-2ppKl7"
}