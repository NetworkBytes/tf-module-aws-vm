
module "ec2_node" {
  source = "terraform-aws-modules/ec2-instance/aws"

  name  = "${var.name == "" ? var.os : var.name}"
  count = 1
  
  ami                    = "${data.aws_ami.ami.id}"
  instance_type          = "{var.instance_type}"
  #key_name               = "user1"
  monitoring             = false
  vpc_security_group_ids = [ 
    "${var.vpc_security_group_ids == "" 
    ? data.aws_security_group.default.id 
    : var.vpc_security_group_ids}"
  ]



  tags = {
    Terraform = "true"
    Environment = "${var.environment}"
  }
  associate_public_ip_address = true
  #subnet_id                   = "${var.subnet_id}"
  #user_data                   = "${data.template_file.user_data.rendered}"

}