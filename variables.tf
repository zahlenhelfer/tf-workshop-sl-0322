variable "app_server_instance_type" {
  type        = string
  default     = "t2.micro"
  description = "The aws instance-type"
}

variable "ami_id" {
  type        = string
  default     = "ami-0f61af304b14f15fb"
  description = "The aws ami-id"
}

variable "node_count" {
  type        = number
  default     = 3
  description = "The number of nodes to create"
}
