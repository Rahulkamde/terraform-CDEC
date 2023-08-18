variable "instance_type" {
    type = string
} 

/* variable "tags" {
  type = any
} */

variable "instance_count" {
  type = number
}

variable "ami_id" {
  type = string
  default = "ami-09f67f6dc966a7829"
}

variable "env" {
  type = string
  default = "variable for the innstance"
}

/* variable "aws_instance_name" {
  type = string
} */