# AWS EC2 Security Group Terraform Module
# Security Group for Public Bastion Host
module "public_bastion_sg" {
  source              = "terraform-aws-modules/security-group/aws"
  version             = "4.9.0"
  name                = "public-bastion-sg"
  description         = "Security Group with SSH port open for everybody (IPv4 CIDR), egress ports are the world"
  vpc_id              = module.vpc.vpc_id
  ingress_rules       = ["ssh-tcp", "http-80-tcp", "http-8080-tcp"]
  ingress_cidr_blocks = ["0.0.0.0/0"]
  egress_rules        = ["all-all"]
  tags                = local.common_tags
}
