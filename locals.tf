locals {


  vpc_security_group_ids_var = "${var.vpc_security_group_ids == "" 
    ? data.aws_security_group.default.id : var.vpc_security_group_ids}"

  vpc_security_group_ids = "${lookup(var.config, "vpc_security_group_ids", local.vpc_security_group_ids_var)}"

  region        = "${lookup(var.config, "region", var.region)}"
  vm_count      = "${lookup(var.config, "vm_count", var.vm_count)}"


  os            = "${lookup(var.config, "os", var.os)}"
  instance_type = "${lookup(var.config, "instance_type", var.instance_type)}"


  ami_name      = "${lookup(var.config, "ami_name", lookup(var.ami_name, local.os))}"
  ami_id        = "${data.aws_ami.ami.id}"


  # if instance_name is blank, use the "local.os" variable
  instance_name = "${lookup(var.config, "instance_name", 
                        var.instance_name == "" ? local.os : var.instance_name
                    )}"


}