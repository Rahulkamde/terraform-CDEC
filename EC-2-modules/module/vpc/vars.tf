variable "cidr_block" {
  type        = string
  description = "this is a block value"
}

variable "public_subnet_cidrs" {
  type        = list(string)
  description = "Public Subnet CIDR values"
}

variable "private_subnet_cidrs" {
  type        = list(string)
  description = "Private Subnet CIDR values"
}

variable "azs" {
  type        = list(string)
  description = "Availability Zones"
}

variable "env" {
  type = string
}

variable "ns" {
  type        = string
  description = "Namespace"
}

variable "tags" {
  type    = map(string)
  description = "tags is must to identify"
}






