###################################
## Amazon AMI lookup
###################################
data "aws_ami" "ami" {
  most_recent = true

  filter {
    name   = "name"
    values = [ "${local.ami_name}" ]
  }
}


###################################
## User Data Config script
###################################
data "template_file" "user_data" {
    template = "${file("${path.module}/files/cloud-init_${local.cm_flavour}_${local.os}.tpl")}"
    vars {
        cm_role         = "${local.cm_role}"
        cm_hostname     = "${local.cm_hostname}"
        cm_master       = "${local.cm_master}"
        cm_client_key   = "${local.cm_client_key}"
        cm_client_name  = "${local.cm_client_name}"
        environment     = "${local.environment}"
    }
}


#data "aws_vpc" "default" {}
#data "aws_availability_zones" "available" {}
#data "aws_subnet" "default" {}
data "aws_security_group" "default" {
  filter {
    name   = "group-name"
    values = ["default"]
  }
}
