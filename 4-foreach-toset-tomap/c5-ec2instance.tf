data "aws_availability_zones" "my_azones" {
  filter {
    name   = "opt-in-status"
    values = ["opt-in-not-required"]
  }
}




#Create EC2 Instance
resource "aws_instance" "ec2-vm" {
  ami = data.aws_ami.amzlinux2.id
  #instance_type = var.instance_type
  instance_type = var.instance_type_list[0]
  #instance_type = var.instance_type_map["dev"]
  user_data = file("${path.module}/app1-install.sh")
  key_name = var.instance_keypair
  vpc_security_group_ids = [ aws_security_group.vpc-ssh.id , aws_security_group.vpc-web.id ]
  count = 2

  #Create EC2 Instance in all AZ of a VPC
  for_each = toset(data.aws_availability_zones.my_azones.names)
  availability_zone = each.key

  tags = {
    "Name" = "For-Each-Demo-${each.value}"
  }
}

