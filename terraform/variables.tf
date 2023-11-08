variable "ARGOCD_ADMIN_PASSWORD" {
  description = "The administration password for ArgoCD"
  type        = string
}

variable "project" {
  description = "The name of the project that we are working on. Provided by TF_VAR env var"
  type        = string
}

variable "region" {
  description = "AWS region"
  type        = string
  default     = "eu-west-2"
}

variable "environment" {
  description = "The name of the environment that we are deploying to"
  type        = string
  default     = "test"
}

variable "instance_type" {
  description = "The AWS EC2 instance type to use"
  type        = string
  default     = "t4g.nano"
}

variable "maximum_nodes" {
  description = "The maximum number of nodes that the cluster is allowed to expand to"
  type        = number
  default     = 3
}

variable "desired_nodes" {
  description = "The desired number of nodes that the cluster should normally run with"
  type        = number
  default     = 2
}

variable "dockerhub_namespace" {
  description = "The DockerHub namespace in which containers will be published"
  type        = string
}

variable "repo_owner" {
  description = "The repository owner"
  type        = string
}

variable "services" {
  description = "Comma-separated list of services"
  type        = string
}

variable "list_of_environments" {
  description = "List of environments"
  type        = list(string)
  default = [
    "test",
    "preprod",
    "prod"
  ]
}

variable "kubernetes_version" {
  description = "Kubernetes `<major>.<minor>` version to use for the EKS cluster"
  type        = string
  default     = "1.28"
}

variable "gtld" {
  description = "The tld of the domain name that we are deploying to"
  type        = string
  default     = "net"
}