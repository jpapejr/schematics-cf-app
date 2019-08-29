variable "app_name" {}
variable "instances" {
  default = "3"
}

variable "memory" {
  default = "128"
}

variable "source_repo" {
  description = "Source code to clone and deploy into CF"
}

variable "region" {
    default = "us-east"
}

variable "org" {}
variable "space" {}

variable "ibm_cloud_api_key" {}
