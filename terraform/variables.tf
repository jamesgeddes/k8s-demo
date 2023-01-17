variable "region" {
  description = "AWS region"
  type        = string
  default     = "eu-west-2"
}

variable "env" {
  description = "The name of the environment that we are deploying to"
  type        = string
  default     = "test"
}

variable "instance_type" {
  description = "The AWS EC2 instance type to use"
  type        = string
  default     = "t3.small"
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