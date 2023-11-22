variable "services" {
  description = "JSON array of services"
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
