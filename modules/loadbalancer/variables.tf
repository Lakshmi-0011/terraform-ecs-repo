variable "vpc_id" {
  description = "vpc id for security grioup"
  type = string
}

variable "name" {
  description = "A name for the target group or ALB"
  type        = string
}

variable "target_group" {
  description = "The ARN of the created target group"
  type        = string
  default     = ""
}

variable "public_subnet_ids" {
  type = list(string)
  default = []
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

variable "vpc" {
  description = "VPC ID for the Target Group"
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