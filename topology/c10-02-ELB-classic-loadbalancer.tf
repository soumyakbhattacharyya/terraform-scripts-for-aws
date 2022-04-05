# Terraform AWS Classic Load Balancer (ELB-CLB)
module "elb" {
  source  = "terraform-aws-modules/elb/aws"
  version = "3.0.1"
  name = "${local.name}-myelb"

  # load balancer belongs to public subnets
  subnets         = [
    module.vpc.public_subnets[0],
    module.vpc.public_subnets[1]
  ]

  # refer to the security group dedicated for the load balancer
  security_groups = [module.loadbalancer_sg.security_group_id]

  # internal = false signifies that it is an external facing load balancer
  #internal        = false

  # there are 2 listener configurations at port 80 and 81 

  listener = [
    {
      instance_port     = 80
      instance_protocol = "HTTP"
      lb_port           = 80
      lb_protocol       = "HTTP"
    },
    {
      instance_port     = 80
      instance_protocol = "HTTP"
      lb_port           = 81
      lb_protocol       = "HTTP"
    },
  ]

  health_check = {
    target              = "HTTP:80/"
    interval            = 30
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 5
  }

  # intances where the load balancer is going to send the traffic
  number_of_instances = var.private_instance_count
  instances           = [
    element([for instance in module.ec2_private: instance.id], 0),
    element([for instance in module.ec2_private: instance.id], 1)
  ]
  tags = local.common_tags
}