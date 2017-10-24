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
    linux   = "unknown CentOS 7 (x86_64) - with Updates HVM*"
  }
}

variable "os" {
  description = "Operating systems to deploy; valid options are \"windows\" or \"linux\""
  default = "windows"
}


variable "aws_region" {
  description = "The configuration management role to apply to this host"
  default = "ap-southeast-2"
}

variable "dnssuffix" {
  description = "The dnssuffix which will be used when calling Chef/Puppet, this is required in order to properly sign the server certificate: TODO - set default to be autogenerated from provider"
  default = ""
}

variable "environment" { default = "dev" }
variable "appid" { default = "" }

variable "cm_flavour" {
  description = "The configuration management software to use; valid options Puppet / Chef"
  default = ""
}

variable "cm_master" {
  description = "The configuration management master host or ip to use when configuring an instance; defaults to \"cm_flavour\" eg puppet"
  default = ""
}

variable "cm_role" {
  description = "The configuration management role to apply to this host"
  default = ""
}





#########################################
# variables from AWS module
#########################################

variable "name" {
  description = "Name to be used on all resources as prefix"
  default = ""
}

variable "count" {
  description = "Number of instances to launch"
  default     = 1
}

variable "ami" {
  description = "ID of AMI to use for the instance"
  default = ""
}

variable "availability_zone" {
  description = "The AZ to start the instance in"
  default     = ""
}

variable "placement_group" {
  description = "The Placement Group to start the instance in"
  default     = ""
}

variable "tenancy" {
  description = "The tenancy of the instance (if the instance is running in a VPC). Available values: default, dedicated, host."
  default     = "default"
}

variable "ebs_optimized" {
  description = "If true, the launched EC2 instance will be EBS-optimized"
  default     = false
}

variable "disable_api_termination" {
  description = "If true, enables EC2 Instance Termination Protection"
  default     = false
}

variable "instance_initiated_shutdown_behavior" {
  description = "Shutdown behavior for the instance" # https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/terminating-instances.html#Using_ChangingInstanceInitiatedShutdownBehavior
  default     = ""
}

variable "instance_type" {
  #description = "The type of instance to start"
  description = "The type of instance to start; defaults to \"t2.micro\""
  default = "t2.micro"
}

variable "key_name" {
  description = "The key name to use for the instance"
  default     = ""
}

variable "monitoring" {
  description = "If true, the launched EC2 instance will have detailed monitoring enabled"
  default     = false
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
  default     = false
}

variable "private_ip" {
  description = "Private IP address to associate with the instance in a VPC"
  default     = ""
}

variable "source_dest_check" {
  description = "Controls if traffic is routed to the instance when the destination address does not match the instance. Used for NAT or VPNs."
  default     = true
}

variable "user_data" {
  description = "The user data to provide when launching the instance"
  default     = ""
}

variable "iam_instance_profile" {
  description = "The IAM Instance Profile to launch the instance with. Specified as the name of the Instance Profile."
  default     = ""
}

variable "ipv6_address_count" {
  description = "A number of IPv6 addresses to associate with the primary network interface. Amazon EC2 chooses the IPv6 addresses from the range of your subnet."
  default     = 0
}

variable "ipv6_addresses" {
  description = "Specify one or more IPv6 addresses from the range of the subnet to associate with the primary network interface"
  default     = ""
}

#variable "tags" {
#  description = "A mapping of tags to assign to the resource"
#  default     = {}
#}

#variable "volume_tags" {
#  description = "A mapping of tags to assign to the devices created by the instance at launch time"
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

variable "ephemeral_block_device" {
  description = "Customize Ephemeral (also known as Instance Store) volumes on the instance"
  default     = ""
}

variable "network_interface" {
  description = "Customize network interfaces to be attached at instance boot time"
  default     = ""
}
