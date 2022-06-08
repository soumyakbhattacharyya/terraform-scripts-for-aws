# VPC Input Variables

# VPC Name
variable "vpc_name" {
  description = "name of the VPC"
  type        = string
  default     = "vpc"
}

# VPC CIDR Block
variable "vpc_cidr_block" {
  description = "CIDR block for the entire VPC"
  type        = string
  default     = "10.0.0.0/16"
}

# VPC Availability Zones
variable "vpc_availability_zones" {
  description = "availability zones across which the VPC spans"
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b"]
}

# VPC Public Subnets
variable "vpc_public_subnets" {
  description = "public subnets of the VPC"
  type        = list(string)
  default     = ["10.0.101.0/24", "10.0.102.0/24"]
}

# VPC Private Subnets
variable "vpc_private_subnets" {
  description = "private subnet of the vpc"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

# VPC Enable NAT Gateway (True or False) 
variable "vpc_enable_nat_gateway" {
  description = "instruction to create NAT gateway for private subnet"
  type        = bool
  default     = true
}

# VPC Single NAT Gateway (True or False)
variable "vpc_single_nat_gateway" {
  description = "enforce creation of single NAT gateway for both of the availability zone"
  type        = bool
  default     = true
}





