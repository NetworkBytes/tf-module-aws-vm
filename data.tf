###################################
## Amazon AMI lookup
###################################
data "aws_ami" "ami" {
  most_recent = true

  filter {
    name   = "name"
    values = [ ${lookup(var.ami_name, var.os} ]
  }
}


###################################
## User Data Config script
###################################
data "template_file" "user_data" {
    template = "${file("scripts/bootstrap_agent-puppet_${var.os}.tpl")}"
    vars {
        role            = ""
        #name            = "${var.name}.infrastructure.lab"
        master_name     = ""
        masterip        = ""
        dnssuffix       = ""
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
