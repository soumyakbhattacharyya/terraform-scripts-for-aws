# AWS EC2 Instance Terraform Outputs
# Public EC2 Instances - Bastion Host

## ec2_bastion_public_instance_ids
output "ec2_bastion_public_instance_ids" {
  description = "List of IDs of instances"
  value       = module.ec2_public.id
}

## ec2_bastion_public_ip
# output "ec2_bastion_public_ip" {
#   description = "List of public IP addresses assigned to the instances"
#   value       = module.ec2_public.public_ip 
# }

output "ec2_bastion_public_ip" {
  description = "List of public IP addresses assigned to the instances"
  value       = aws_eip.bastion_eip.public_ip
}

# Private EC2 Instances
## ec2_private_instance_ids

output "app1_ec2_private_instance_ids" {
  description = "List of IDs of instances"
  #value       = [module.ec2_private_app1.id]
  value = [for ec2private in module.ec2_private_app1 : ec2private.id]
}

## ec2_private_ip
output "app1_ec2_private_ip" {
  description = "List of private IP addresses assigned to the instances"
  #value       = [module.ec2_private_app1.private_ip]
  value = [for ec2private in module.ec2_private_app1 : ec2private.private_ip]
}




