provider "aws" {
    region = var.region
    profile = "aws-user"
}

resource "aws_s3_bucket" "bucket" {
    bucket = var.s3_bucket_name
    acl = var.acl_value
    tags = {
        Name        = "My bucket"
        Environment = "Dev"
    }
}