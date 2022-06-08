# Purpose - hosts generic sets of variables used by the topology
# AWS Region
variable "aws_region" {
  description = "Region in which AWS Resources to be created"
  type        = string
  default     = "us-east-1"
}
# Environment Variable
variable "environment" {
  description = "Environment that will prefix all resources"
  type        = string
  default     = "management"
}
# Business Division
variable "business_division" {
  description = "Business devision to which the provisioned infrastructure belongs"
  type        = string
  default     = "paymatrix"
}
