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

variable "ami_name" {
  type = "map"
  description = "The name of the Amazon AMI image to use; defaults dependent on var.os, an OS of windows defaults to Windows_Server-2016-English-Full-Base-*, linux defaults to TODO"

  default = {
    windows = "Windows_Server-2016-English-Full-Base-*"
    linux   = "CentOS Linux 7 x86_64 HVM EBS*"
  }
}

variable "ami" {
  description = "ID of AMI to use for the instance"
  default = ""
}

variable "os" {
  description = "Operating systems to deploy; valid options are \"windows\" or \"linux\""
  default = "linux"
}


variable "aws_region" {
  description = "The configuration management role to apply to this host"
  default = "ap-southeast-2"
}


variable "count" {
  description = "Number of instances to launch"
  default     = 1
}


#########################################
# Config Management Variables
#########################################

variable "cm_flavour" {
  description = "The configuration management software to use; valid options Puppet / Chef"
  default = "none"
}

variable "cm_master" {
  description = "The configuration management master host or ip to use when configuring an instance; defaults to \"cm_flavour\" eg puppet"
  default = ""
}

variable "cm_role" {
  description = "The configuration management role to apply to this host"
  default = ""
}

variable "cm_client_key" {
  description = "The configuration management key to use when connecting to the master server"
  default = ""
}

variable "cm_hostname" { default = ""}
variable "cm_client_name" { default = ""}
variable "environment" { default = "dev" }
variable "appid" { default = "" }


#########################################
# Connectivity Variables
#########################################

variable "user" {
  description = "The provisioner connection user; defaults to centos for linux and Administrator for windows"
  default = ""
}

variable "key_name" {
  description = "The key name to use for the instance"
  default     = ""
}

variable "key_file" {
  description = "The path to the ssh key file to use for connecting to the instance; default \"~/.ssh/id_rsa.pub\""
  default     = "~/.ssh/id_rsa.pub"
}

variable "key_file_private" {
  description = "The path to the ssh private key file to use for connecting to the instance; default \"~/.ssh/id_rsa\""
  default     = "~/.ssh/id_rsa"
}

variable "name" {
  description = "Name to be used on all resources as prefix"
  default = ""
}



variable "user_data" {
  description = "The user data to provide when launching the instance"
  default     = ""
}


variable "availability_zone" {
  description = "The AZ to start the instance in"
  default     = ""
}

variable "placement_group" {
  description = "The Placement Group to start the instance in"
  default     = ""
}


variable "instance_type" {
  #description = "The type of instance to start"
  description = "The type of instance to start; defaults to \"t2.micro\""
  default = "t2.micro"
}


variable "vpc_security_group_ids" {
  description = "A list of security group IDs to associate with"
  #type        = "list"
  default      = ""
}

variable "subnet_id" {
  description = "The VPC Subnet ID to launch in"
  default     = ""
}

variable "associate_public_ip_address" {
  description = "If true, the EC2 instance will have associated public IP address"
  default     = true
}

variable "private_ip" {
  description = "Private IP address to associate with the instance in a VPC"
  default     = ""
}

variable "iam_instance_profile" {
  description = "The IAM Instance Profile to launch the instance with. Specified as the name of the Instance Profile."
  default     = ""
}

#variable "tags" {
#  description = "A mapping of tags to assign to the resource"
#  default     = {}
#}


variable "root_block_device" {
  description = "Customize details about the root block device of the instance. See Block Devices below for details"
  default     = ""
}

variable "ebs_block_device" {
  description = "Additional EBS block devices to attach to the instance"
  default     = ""
}

