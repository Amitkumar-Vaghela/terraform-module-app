resource "aws_s3_bucket" "remote_infra" {
  bucket = "${var.env}-${var.bucket_name}"

  tags = {
    Name = "infra-app-bucket-amit"
    Environment = var.env
  }
}