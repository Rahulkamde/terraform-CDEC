#variable "aws_iam_user_name" {
#  type = string  # required
#  description = "variable for the iam user"
#}



variable "aws_iam_user_name" {
  type = list  # required
  description = "variable for the iam user"
}


variable "env" {
  type = string
  default = "variable for environment"
}

