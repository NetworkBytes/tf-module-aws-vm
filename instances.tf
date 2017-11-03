resource "aws_instance" "this" {
  count = "${local.count}"

  ami                    = "${local.ami}"
  instance_type          = "${local.instance_type}"
  user_data              = "${local.user_data}"
  subnet_id              = "${local.subnet_id}"
  key_name               = "${local.key_name}"
  vpc_security_group_ids = ["${local.vpc_security_group_ids}"]
  iam_instance_profile   = "${local.iam_instance_profile}"

  associate_public_ip_address = "${local.associate_public_ip_address}"
  #private_ip                  = "${local.private_ip}"
  
  #root_block_device      = "${local.root_block_device}"
  #ebs_block_device       = "${local.ebs_block_device}"
  #ephemeral_block_device = "${local.ephemeral_block_device}"

  availability_zone                    = "${local.availability_zone}"
  placement_group                      = "${local.placement_group}"

  #tags = "${merge(local.tags, map("Name", format("%s-%d", local.name, count.index+1)))}"

  


  #########################################
  # Provisioners 
  #########################################

  connection {
    type        = "ssh" #TODO support winrm
    user        = "${local.user}"
    private_key = "${file(pathexpand(local.key_file_private))}"
  }


  provisioner "file" {
    source = "${path.module}/files/getstatus_cloud-init.py"
    destination = "/tmp/getstatus_cloud-init.py"
  }

  provisioner "remote-exec" {
    inline = "python /tmp/getstatus_cloud-init.py"
  }
}
