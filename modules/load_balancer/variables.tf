variable "lb_name" {
  description = "The name of the load balancer"
  type        = string
}

variable "vpc_id" {
  description = "The ID of the VPC"
  type        = string
}

variable "subnet_ids" {
  description = "The IDs of the subnets for the load balancer"
  type        = list(string)
}
