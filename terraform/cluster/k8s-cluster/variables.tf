variable "desired_nodes" {
  description = "The desired number of nodes in the Kubernetes cluster"
  type        = number
}

variable "environment" {
  description = "The deployment environment (e.g., 'prod', 'dev', 'staging')"
  type        = string
}

variable "instance_type" {
  description = "The EC2 instance type for the EKS cluster nodes"
  type        = string
}

variable "kubernetes_version" {
  description = "The version of Kubernetes to use for the EKS cluster"
  type        = string
}

variable "maximum_nodes" {
  description = "The maximum number of nodes in the Kubernetes cluster"
  type        = number
}

variable "private_subnet_ids" {
  description = "A list of private subnet IDs for the EKS cluster"
  type        = list(string)
}

variable "vpc_id" {
  description = "The VPC ID where the EKS cluster will be deployed"
  type        = string
}
