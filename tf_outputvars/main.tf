provider "aws" {
    region = var.region
    profile = "aws-user"
}

resource "aws_s3_bucket" "bucket" {
    bucket = var.aws_s3_bucket_name
    acl = var.aws_s3_bucket_acl_value
    tags = {
        Name        = "My bucket"
        Environment = "Dev"
    }
}