variable "app_name" {}
variable "instances" {
  default = "3"
}

variable "memory" {
  default = "128"
}

variable "app_zip_url" {
  description = "Source code to clone and deploy into CF"
}

variable "region" {
    default = "us-south"
}

variable "app_host" {
  
}


variable "org" {}
variable "space" {}

variable "ibm_cloud_api_key" {}
