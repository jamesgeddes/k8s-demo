variable "service" {
  description = "The name of the service that we are working on"
  type        = string
}

variable "project" {
  description = "The name of the project that we are working on."
  type        = string
}

variable "dockerhub_namespace" {
  description = "The DockerHub namespace in which containers will be published"
  type        = string
}
