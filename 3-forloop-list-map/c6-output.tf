
#Output - For Loop woth List
output "for_output_list" {
    description = "For Loop with List"
    value = [for instance in aws_instance.ec2-vm: instance.public_dns]
}

#Output -For Loop with Map
output "for_output_map1" {
  description = "For Loop with Map"
  value = {for instance in aws_instance.ec2-vm: instance.id =>instance.public_dns}
}

#Output - ForLoop with Map Advanced
output "for_output_map2" {
  description = "For Loop with Map - Advanced"
  value = {for c, instance in aws_instance.ec2-vm : c => instance.public_dns }
}

# Output Legacy Splat Operator (legacy) - Returns the List
output "legacy_splat_instance_publicdns" {
    description = "Legacy Splat Operator"
    value = aws_instance.ec2-vm.*.public_dns
}

# Output Latest Generalized Splat Operator  - Returns the List
output "latest_splat_instance_publicdns" {
    description = "Generalized Splat Operator"
    value = aws_instance.ec2-vm[*].public_dns
}