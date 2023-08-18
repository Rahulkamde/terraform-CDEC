resource "aws_s3_bucket" "then" {
  count = length(var.bucket_name)  
  bucket = "${var.bucket_name[count.index]}-${var.env}"
}



#resource "aws_s3_bucket" "then" {
#  bucket = var.bucket_name 
#}

