resource "aws_lb" "dev" {
  name               = "dev-lb-tf"
  internal           = false
  load_balancer_type = "application"
  subnets            = ["subnet-02429cbb741d746b5", "subnet-01f63a9cb0cdccf08"]

  tags = {
    Environment = "production"
  }
}

  variable "target_group_names" {
    type    = list(string)
    default = ["tg-1", "tg-2", "tg-3", "tg-4", "tg-5"]
  }


resource "aws_lb_target_group" "dev" {
  count    = 5  
  name     = var.target_group_names[count.index]
  port     = 80
  protocol = "HTTP"
}


