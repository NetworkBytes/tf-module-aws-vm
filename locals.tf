locals {

  os            = "${lookup(var.config, "os", var.os)}"
  aws_region    = "${lookup(var.config, "aws_region", var.aws_region)}"

  ami_name      = "${lookup(var.config, "ami_name", lookup(var.ami_name, local.os))}"
  ami        = "${var.ami == "" ? data.aws_ami.ami.id : var.ami}"


  vpc_security_group_ids_var = "${var.vpc_security_group_ids == ""
    ? data.aws_security_group.default.id : var.vpc_security_group_ids}"

  vpc_security_group_ids = ["${split(",", lookup(var.config, "vpc_security_group_ids", local.vpc_security_group_ids_var))}"]

  # if name is blank, default to using "local.os"
  name_var = "${var.name == "" ? local.os : var.name}"
  name = "${lookup(var.config, "name", local.name_var)}"

  # Chef or Puppet
  cm_flavour      = "${lookup(var.config, "cm_flavour" , var.cm_flavour)}"
  cm_master       = "${lookup(var.config, "cm_master"  , var.cm_master)}"
  cm_role         = "${lookup(var.config, "cm_role"    , var.cm_role)}"
  cm_client_key   = "${lookup(var.config, "cm_client_key" , var.cm_client_key)}"
  cm_client_name  = "${lookup(var.config, "cm_client_name", var.cm_client_name)}"
  cm_hostname     = "${lookup(var.config, "cm_hostname"   , var.cm_hostname)}"

  user_data       = "${lookup(var.config, "user_data"  , var.user_data == "" ? data.template_file.user_data.rendered : var.user_data)}"

  environment = "${lookup(var.config, "environment" , var.environment)}"
  appid = "${lookup(var.config, "appid" , var.appid)}"




  tags = {
    Terraform = "true"
    Environment = "${local.environment}"
  }
  #tags           = "${lookup(var.config, "tags" , var.tags)}"

  
  # provisioner user
  user_default    = "${local.os == "windows" ? "Administrator" : "centos"}"
  user            = "${lookup(var.config, "user", local.user_default)}"

  count           = "${lookup(var.config, "count" , var.count)}"
  availability_zone = "${lookup(var.config, "availability_zone" , var.availability_zone)}"
  placement_group = "${lookup(var.config, "placement_group" , var.placement_group)}"
  instance_type   = "${lookup(var.config, "instance_type" , var.instance_type)}"


  key_file = "${lookup(var.config, "key_file" , var.key_file)}"
  key_file_private = "${lookup(var.config, "key_file_private" , var.key_file_private)}"

  # extract key from ssh keyfile
  key_name_from_file = "${replace(element(split(" ", file(pathexpand(local.key_file))),2),"\n", "")}"
  key_name_var       = "${var.key_name == "" ? local.key_name_from_file : var.key_name}"
  key_name           = "${lookup(var.config, "key_name" , local.key_name_var)}"

  subnet_id       = "${lookup(var.config, "subnet_id" , var.subnet_id)}"
  associate_public_ip_address = "${lookup(var.config, "associate_public_ip_address" , var.associate_public_ip_address)}"
  private_ip      = "${lookup(var.config, "private_ip" , var.private_ip)}"
  iam_instance_profile = "${lookup(var.config, "iam_instance_profile" , var.iam_instance_profile)}"
  root_block_device = ["${split(",", lookup(var.config, "root_block_device" , var.root_block_device))}"]
}
