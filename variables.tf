variable "region" {
  default = "ap-southeast-2"
}

variable os {
  #default = "windows"
  default = "linux"
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