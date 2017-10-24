provider "aws" {
  #access_key = "${var.access_key}"
  #secret_key = "${var.secret_key}"
  region      = "${local.aws_region}"
}
#resource "aws_key_pair" "mykey" {
#  key_name = "mykey"
#  public_key = "${file("keys/mykey.pub")}"
#}
