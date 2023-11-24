variable "gtld" {
  description = "The Generic top level domain that we are working in"
  type        = string
}

variable "project" {
  description = "The name of this project"
}

variable "service" {
  description = "The name of the service that we are working with"
  type        = string
}

variable "hcp_project_id" {
  description = "The ID of the HCP project that we are working in"
  type        = string
}