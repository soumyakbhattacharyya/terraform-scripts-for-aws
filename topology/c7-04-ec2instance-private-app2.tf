# AWS EC2 Instance Terraform Module
# EC2 Instances that will be created in VPC Private Subnets

# AWS EC2 Instance Terraform Module
# EC2 Instances that will be created in VPC Private Subnets
module "ec2_private_app2" {
  depends_on = [ module.vpc ] # VERY VERY IMPORTANT else userdata webserver provisioning will fail
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "3.5.0"
   #for_each = toset([ module.vpc.private_subnets[0],module.vpc.private_subnets[1] ])
   for_each = toset(["0", "1"])
  # insert the 10 required variables here
  name                   = "${var.environment}-vm-${each.key}-app2"
  ami                    = data.aws_ami.amzlinux2.id
  instance_type          = var.instance_type
  key_name               = var.instance_keypair
  #monitoring             = true
  vpc_security_group_ids = [module.private_sg.security_group_id]
  
  subnet_id =  element(module.vpc.private_subnets, tonumber(each.key))
#   instance_count         = var.private_instance_count
  user_data = file("${path.module}/app2-install.sh")
  tags = local.common_tags
}
 
