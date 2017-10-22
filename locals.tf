locals {
  vpc_security_group_ids = [ 
    "${var.vpc_security_group_ids == "" 
    ? data.aws_security_group.default.id 
    : var.vpc_security_group_ids}"
  ]

}