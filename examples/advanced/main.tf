resource "random_id" "key" { byte_length = 4 }
resource "null_resource" "keygen" {
  provisioner "local-exec" {
    command = "ssh-keygen -b 2048 -t rsa -f key-${local.random_id} -q -N '' -C 'key-${local.random_id}'"
  }
}

locals {

  # This is just a hardcoded sample however the config can get generated 
  # from any key/value store eg consul for a given host

  config = {
    name = "myname"
    subnet_id = "subnet-a0de23f9"
    vpc_security_group_ids = "sg-8233e0e4,sg-090cdf6f"
    os = "linux"
    associate_public_ip_address = true
    #key_file = "/tmp/key-${local.random_id}"
  }
  random_id = "${random_id.key.dec}"
}


module "advanced_instance" {
  source = "../../"
  config = "${local.config}"
}
