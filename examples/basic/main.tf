
locals {

  # This is just a hardcoded sample however the config can get generated 
  # from any key/value store eg consul for a given host

  config = {
    name = "myname"
    subnet_id = "subnet-a0de23f9"
    vpc_security_group_ids = "sg-8233e0e4,sg-090cdf6f"
    os = "linux"
    key_name = "john@Johns-MacBook-Pro.local"
    associate_public_ip_address = "true"
  }

}


module "basic_instance" {
  source = "../../"
  config = "${local.config}"
}
