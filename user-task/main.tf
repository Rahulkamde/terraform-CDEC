########## create multiple user #############

resource "aws_iam_group_membership" "demo" {
  name = "members"

  users = [
    aws_iam_user.user_one.name,
    aws_iam_user.user_two.name,
    aws_iam_user.user_three.name,
    aws_iam_user.user_four.name,
    aws_iam_user.user_five.name
  ]

  group = aws_iam_group.group.name
}


resource "aws_iam_group" "group" {
  name = "Cloudblitz"
}


resource "aws_iam_user" "user_one" {
  name = "task-user-one"
  tags = {
    name      = "rahulk"
    purpose   = "terraform-user-create"
    startdate = "06/08/2023" 
  }
}

resource "aws_iam_user" "user_two" {
  name = "task-user-two"
  tags = {
    name      = "rahulk"
    purpose   = "terraform-user-create"
    startdate = "06/08/2023" 
  }
}

resource "aws_iam_user" "user_three" {
  name = "task-user-three"
  tags = {
    name      = "rahulk"
    purpose   = "terraform-user-create"
    startdate = "06/08/2023" 
  }
}

resource "aws_iam_user" "user_four" {
  name = "task-user-four"
  tags = {
    name      = "rahulk"
    purpose   = "terraform-user-create"
    startdate = "06/08/2023" 
  }
}

resource "aws_iam_user" "user_five" {
  name = "task-user-five"
  tags = {
    name      = "rahulk"
    purpose   = "terraform-user-create"
    startdate = "06/08/2023" 
  }
}
