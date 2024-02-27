variable "vpc_cidr" {
  type = string
  description = "cidr range for vpc"
}

variable "prisub1_cidr" {
  type = string
  description = "cidr range for private subnet 1"
}

variable "prisub2_cidr" {
  type = string
  description = "cidr range for private subnet 2"
}

variable "pubsub1_cidr" {
  type = string
  description = "cidr range for public subnet 1"
}

variable "pubsub2_cidr" {
  type = string
  description = "cidr range for public subnet 2"
}

variable "az1" {
  type = string
  description = "value for availability zone 1"
}

variable "az2" {
  type = string
  description = "value for availability zone 2"
}

variable "vpc_name" {
type = string
description = "name for vpc"
}

variable "prisub1_name" {
type = string
description = "name for private subnet 1"
}

variable "prisub2_name" {
type = string
description = "name for private subnet 2"
}

variable "pubsub1_name" {
type = string
description = "name for public subnet 1"
}

variable "pubsub2_name" {
type = string
description = "name for public subnet 2"
}

variable "igw_name" {
  type = string
  description = "name for internet gateway"
}

variable "eip1_name" {
  type = string
  description = "name for elastic ip in ap-south-1a"
}

variable "eip2_name" {
  type = string
  description = "name for elastic ip in ap-south-1b"
}

variable "nat1_name" {
  type = string
  description = "value for name of the nat gateway in ap-south-1a"
}

variable "nat2_name" {
  type = string
  description = "value for name of the nat gateway in ap-south-1b"
}

variable "rtpri1_name" {
  type = string
  description = "value for name of the private route table in ap-south-1a"
}

variable "rtpri2_name" {
  type = string
  description = "value for name of the private route table in ap-south-1b"
}

variable "pubrt_name" {
  type = string
  description = "value for name of the pubic route table"
}

variable "cluster_name" {
  description = "The name of the deployed environment"
  type        = string
}

variable "lb_name" {
  description = "A name for the target group or ALB"
  type        = string
}

variable "target_group" {
  description = "The ARN of the created target group"
  type        = string
  default     = ""
}

variable "port" {
  description = "The port that the targer group will use"
  type        = number
  default     = 80
}

variable "protocol" {
  description = "The protocol that the target group will use"
  type        = string
  default     = ""
}

variable "tg_type" {
  description = "Target Group Type (instance, IP, lambda)"
  type        = string
  default     = ""
}

variable "tg_name" {
  description = "A name for the target group or ALB"
  type        = string
}

variable "taskdefinition_name" {
  description = "The name for Task Definition"
  type        = string
}

variable "container_name" {
  description = "The name of the Container specified in the Task definition"
  type        = string
}

variable "cpu" {
  description = "The CPU value to assign to the container, read AWS documentation for available values"
  type        = string
}

variable "memory" {
  description = "The MEMORY value to assign to the container, read AWS documentation to available values"
  type        = string
}

variable "docker_repo" {
  description = "The docker registry URL in which ecs will get the Docker image"
  type        = string
}

variable "region" {
  description = "AWS Region in which the resources will be deployed"
  type        = string
}

variable "container_port" {
  description = "The port that the container will use to listen to requests"
  type        = number
}

variable "service_name" {
  description = "The name for the ecs service"
  type        = string
}

variable "con_port" {
  description = "The port that the container will listen request"
  type        = string
}

variable "con_name" {
  description = "The name of the container"
  type        = string
}