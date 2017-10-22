#########################################
# Config Map variable
#########################################

variable "config" {
  type = "map"

  default {}
}


#########################################
# Standard Variables
#########################################

variable "region" {
  default = "ap-southeast-2"
}

variable os {
  default = "windows"
  #default = "linux"
}

variable "dnssuffix" {
  default = ""
}

variable environment {
  default = "dev"
}

variable "instance_type" {
	default = "t2.micro"
}

variable "name" {
  default = ""
}

variable "vpc_security_group_ids" {
  default = ""
}

variable "ami_name" {
  type = "map"

  default = {
    windows = "Windows_Server-2016-English-Full-Base-*"
    linux = "unknown CentOS 7 (x86_64) - with Updates HVM*"
  }
}