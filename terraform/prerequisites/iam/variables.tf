variable "account_id" {
  description = "AWS Account ID"
  type        = string
}

variable "region" {
  description = "AWS Region for EKS"
  type        = string
}

variable "eks_cluster_oidc_id" {
  description = "OIDC ID of the EKS Cluster"
  type        = string
}

variable "eks_cluster_name" {
  description = "Name of the EKS Cluster"
  type        = string
}

variable "eks_cluster_issuer_url" {
  description = "Issuer URL of the EKS Cluster OIDC Provider"
  type        = string
}
