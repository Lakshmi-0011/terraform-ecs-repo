variable "vpc_cidr" {
  type = string
  description = "cidr range for vpc"
  default = "10.3.0.0/16"
}

variable "prisub1_cidr" {
  type = string
  description = "cidr range for private subnet 1"
  default = "10.3.1.0/24"
}

variable "prisub2_cidr" {
  type = string
  description = "cidr range for private subnet 2"
  default = "10.3.2.0/24"
}

variable "pubsub1_cidr" {
  type = string
  description = "cidr range for public subnet 1"
  default = "10.3.3.0/24"
}

variable "pubsub2_cidr" {
  type = string
  description = "cidr range for public subnet 2"
  default = "10.3.4.0/24"
}

variable "az1" {
  type = string
  description = "value for availability zone 1"
  default = "ap-south-1a"
}

variable "az2" {
  type = string
  description = "value for availability zone 2"
  default = "ap-south-1b"
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