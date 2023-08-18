resource "aws_instance" "then" {
  ami = var.ami_id
  count = var.instance_count
  instance_type = var.instance_type
  tags = {
    Name = "rahul-${count.index + 1}-${var.env}"
  }
}
