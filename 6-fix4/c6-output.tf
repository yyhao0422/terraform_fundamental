

# EC2 instance Public IP with toset
output "instance_publicip" {
    description = "Legacy Splat Operator"
    #for each cannot use splat operator
    #value = aws_instance.ec2-vm.*.public_dns
    value = toset([for instance in aws_instance.ec2-vm : instance.public_ip])
}

# EC2 instance Public DNS with toset  
output "instance_publicdns" {
    description = "Generalized Splat Operator"
    #value = aws_instance.ec2-vm[*].public_dns
    value = toset([for instance in aws_instance.ec2-vm : instance.public_dns])
}


# EC2 instance Public DNS with toset  
output "instance_publicdns2_map" {
  value = tomap({for az,instance in aws_instance.ec2-vm: az => instance.public_dns})
}