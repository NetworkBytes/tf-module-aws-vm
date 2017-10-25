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
    template = "${file("${path.module}/scripts/bootstrap_agent-puppet_${local.os}.tpl")}"
    vars {
        role            = ""
        name            = "${local.name}.${local.dnssuffix}"
        master_name     = ""
        masterip        = ""
        dnssuffix       = "${local.dnssuffix}"
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
