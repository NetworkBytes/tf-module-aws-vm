
module "ec2_node" {
  source = "terraform-aws-modules/ec2-instance/aws"
  name = "${local.name}"
######
# EC2 instance
######
#resource "aws_instance" "this" {
#  count = "${local.count}"
#
  ami                    = "${local.ami}"
  instance_type          = "${local.instance_type}"
  user_data              = "${local.user_data}"
  subnet_id              = "${local.subnet_id}"
  key_name               = "${local.key_name}"
  monitoring             = "${local.monitoring}"
  vpc_security_group_ids = ["${local.vpc_security_group_ids}"]
  iam_instance_profile   = "${local.iam_instance_profile}"

  associate_public_ip_address = "${local.associate_public_ip_address}"
  private_ip                  = "${local.private_ip}"
  #ipv6_address_count          = "${local.ipv6_address_count}"
  #ipv6_addresses              = "${local.ipv6_addresses}"

  #ebs_optimized          = "${local.ebs_optimized}"
  #volume_tags            = "${local.volume_tags}"
  #root_block_device      = "${local.root_block_device}"
  #ebs_block_device       = "${local.ebs_block_device}"
  #ephemeral_block_device = "${local.ephemeral_block_device}"

  source_dest_check                    = "${local.source_dest_check}"
  #disable_api_termination              = "${local.disable_api_termination}"
  #instance_initiated_shutdown_behavior = "${local.instance_initiated_shutdown_behavior}"
  availability_zone                    = "${local.availability_zone}"
  placement_group                      = "${local.placement_group}"
  tenancy                              = "${local.tenancy}"#

  # Note: network_interface can't be specified together with associate_public_ip_address
  # network_interface = "${local.network_interface}"

  #tags = "${merge(local.tags, map("Name", format("%s-%d", local.name, count.index+1)))}"
}
