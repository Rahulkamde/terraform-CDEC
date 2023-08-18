#resource "aws_iam_user" "then" {
#  name = var.aws_iam_user_name 
#}



resource "aws_iam_user" "then" {
  count = length(var.aws_iam_user_name)  
  name = "${var.aws_iam_user_name[count.index]}-${var.env}"
}
