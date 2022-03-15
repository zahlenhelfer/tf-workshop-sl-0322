variable "app_server_instance_type" {
  type        = string
  default     = "t2.micro"
  description = "The aws instance-type"
}

variable "ami_id" {
  type = map(string)
  default = {
    eu-central-1 = "ami-0f61af304b14f15fb"
    eu-west-1    = "ami-0db188056a6ff81ae"
  }
  description = "The aws ami-id"
}

variable "node_count" {
  type        = number
  default     = 3
  description = "The number of nodes to create"
}

variable "region" {
  type        = string
  default     = "eu-central-1"
  description = "The aws region"
}
