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
  default     = "sl-mro-42-666"
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

variable "vpc_id" {
  type        = string
  default     = "vpc-06858e90730fe1467"
  description = "The aws vpc-id"
}

variable "db_instance_type" {
  type        = string
  default     = "db.t2.micro"
  description = "The aws instance-type"
}

variable "db_name" {
  type        = string
  default     = "slmrodb"
  description = "The name of the database"
}

variable "db_user" {
  type        = string
  default     = "master"
  description = "The username of the database"
}

variable "db_password" {
  type        = string
  default     = "Geheim123!"
  description = "The username of the database"
}
