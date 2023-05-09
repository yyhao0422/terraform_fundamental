#Datasource-1
data "aws_availability_zones" "my_azones" {
  filter {
    name ="opt-in-status"
    values = ["opt-in-not-required"]
  }
}



#Datasource-2
data "aws_ec2_instance_type_offerings" "my_instype" {
  for_each = toset(data.aws_availability_zones.my_azones.names)
  filter {
    name   = "instance-type"
    values = ["t3.micro"]
  }

  filter {
    name   = "location"
    values = [each.key]

  }

  location_type = "availability-zone"
}


#Output-1
#Basic Output: All Availability Zones mapped to Supported Instance type

output "output_v3_1" {
  value = {
    for az,details in data.aws_ec2_instance_type_offerings.my_instype: az => details.instance_types
  }
}

#Output-2
#Filtered Output: Exclude unsupported Availability zones
output "output_v3_2" {
  value = {
    for az,details in data.aws_ec2_instance_type_offerings.my_instype:
     az => details.instance_types if length(details.instance_types) != 0 
  }
}

#Output-3
#Filtered Output: with Key function - Which gets keys from a Map
#This will return the list of availability zones supported for a instance type

output "output_v3_3" {
    value = keys({
    for az,details in data.aws_ec2_instance_type_offerings.my_instype:
     az => details.instance_types if length(details.instance_types) != 0 
  })
}

#Output-4
#Filtered Output: As the output is list now, get the first item from list (just for learning)

output "output_v3_4" {
    value = keys({
    for az,details in data.aws_ec2_instance_type_offerings.my_instype:
     az => details.instance_types if length(details.instance_types) != 0 
  })[0]
}




