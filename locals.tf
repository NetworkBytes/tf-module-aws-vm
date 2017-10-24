locals {

  os            = "${lookup(var.config, "os", var.os)}"

  ami_name      = "${lookup(var.config, "ami_name", lookup(var.ami_name, local.os))}"
  ami        = "${var.ami == "" ? data.aws_ami.ami.id : var.ami}"


  #vpc_security_group_ids_var = "${var.vpc_security_group_ids == ""
  #  ? data.aws_security_group.default.id : var.vpc_security_group_ids}"

  #vpc_security_group_ids = "${lookup(var.config, "vpc_security_group_ids", local.vpc_security_group_ids_var)}"

  # if name is blank, default to using "local.os"
  name_var = "${var.name == "" ? local.os : var.name}"
  name = "${lookup(var.config, "name", local.name_var)}"

  environment = "${lookup(var.config, "environment" , var.environment)}"
  appid = "${lookup(var.config, "appid" , var.appid)}"


  #########################################
  # variables from AWS module
  #########################################
  #name = "${lookup(var.config, "name" , var.name)}"
  count = "${lookup(var.config, "count" , var.count)}"
  #ami = "${lookup(var.config, "ami" , var.ami)}"
  availability_zone = "${lookup(var.config, "availability_zone" , var.availability_zone)}"
  placement_group = "${lookup(var.config, "placement_group" , var.placement_group)}"
  tenancy = "${lookup(var.config, "tenancy" , var.tenancy)}"
  ebs_optimized = "${lookup(var.config, "ebs_optimized" , var.ebs_optimized)}"
  disable_api_termination = "${lookup(var.config, "disable_api_termination" , var.disable_api_termination)}"
  instance_initiated_shutdown_behavior = "${lookup(var.config, "instance_initiated_shutdown_behavior" , var.instance_initiated_shutdown_behavior)}"
  instance_type = "${lookup(var.config, "instance_type" , var.instance_type)}"
  key_name = "${lookup(var.config, "key_name" , var.key_name)}"
  monitoring = "${lookup(var.config, "monitoring" , var.monitoring)}"
  vpc_security_group_ids = "${lookup(var.config, "vpc_security_group_ids" , var.vpc_security_group_ids)}"
  subnet_id = "${lookup(var.config, "subnet_id" , var.subnet_id)}"
  associate_public_ip_address = "${lookup(var.config, "associate_public_ip_address" , var.associate_public_ip_address)}"
  private_ip = "${lookup(var.config, "private_ip" , var.private_ip)}"
  source_dest_check = "${lookup(var.config, "source_dest_check" , var.source_dest_check)}"
  user_data = "${lookup(var.config, "user_data" , var.user_data)}"
  iam_instance_profile = "${lookup(var.config, "iam_instance_profile" , var.iam_instance_profile)}"
  ipv6_address_count = "${lookup(var.config, "ipv6_address_count" , var.ipv6_address_count)}"
  ipv6_addresses = "${lookup(var.config, "ipv6_addresses" , var.ipv6_addresses)}"
  tags = "${lookup(var.config, "tags" , var.tags)}"
  volume_tags = "${lookup(var.config, "volume_tags" , var.volume_tags)}"
  root_block_device = "${lookup(var.config, "root_block_device" , var.root_block_device)}"
  ebs_block_device = "${lookup(var.config, "ebs_block_device" , var.ebs_block_device)}"
  ephemeral_block_device = "${lookup(var.config, "ephemeral_block_device" , var.ephemeral_block_device)}"
  network_interface = "${lookup(var.config, "network_interface" , var.network_interface)}"
}
