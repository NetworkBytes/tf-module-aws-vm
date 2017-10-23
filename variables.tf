#########################################
# Config Map variable
#########################################

variable "config" {
  type = "map"
  description = "Config Map which can be passed to this module"
  default {}
}


#########################################
# Standard Variables
#########################################

variable "region" {
  description = "The AWS region which this virtual machine will be provisioned into."
  default = "ap-southeast-2"
  type = "string" 
}

variable vm_count {
  description = "Count of how many instances to provision"
  default = "1"
  type = "string" 
}

variable os {
  description = "Operating systems to deploy; valid options are \"windows\" or \"linux\""
  default = "windows"
  type = "string" 
}

variable "dnssuffix" {
  description = "The dnssuffix which will be used when calling Chef/Puppet, this is required in order to properly sign the server certificate: TODO - set default to be autogenerated from provider"
  default = ""
  type = "string" 
}

variable environment {
  default = "dev"
  type = "string" 
}

variable "instance_type" {
  description = "The AWS EC2 instance type to use; defaults to \"t2.micro\""
  type = "string" 
	default = "t2.micro"
}

variable "instance_name" {
  description = "The name for the instance; defaults to var.os eg windows/linux"
  default = ""
}

variable "vpc_security_group_ids" {
  default = ""
}

variable "ami_name" {
  type = "map"
  description = "The name of the Amazon AMI image to use; defaults dependent on var.os, an OS of windows defaults to Windows_Server-2016-English-Full-Base-*, linux defaults to TODO"

  default = {
    windows = "Windows_Server-2016-English-Full-Base-*"
    linux   = "unknown CentOS 7 (x86_64) - with Updates HVM*"
  }
}