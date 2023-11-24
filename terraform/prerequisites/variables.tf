variable "dockerhub_namespace" {
  description = "The DockerHub namespace in which containers will be published"
  type        = string
}

variable "gtld" {
  description = "The Generic top level domain that we are working in"
  type        = string
}

variable "hcp_project_id" {
  description = "The ID of the HCP project that we are working in"
  type        = string
}

variable "project" {
  description = "The name of this project"
  type        = string
}

variable "services" {
  description = "JSON array of services"
  type        = string
}
