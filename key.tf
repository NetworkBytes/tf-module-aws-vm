resource "aws_key_pair" "key" {
  key_name   = "${local.key_name}"
  public_key = "${file(pathexpand(local.key_file))}"
}
