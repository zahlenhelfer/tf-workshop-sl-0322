variable "app_server_instance_type" {
  type        = string
  default     = "t2.micro"
  description = "The aws instance-type"
}

variable "deploy_database_as_ec2" {
  default     = false
  type        = bool
  description = "value of true will deploy database as ec2 instance"
}

variable "static_bucket_name" {
  type        = string
  default     = "sl-mro-42"
  description = "The name of the static bucket"
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
