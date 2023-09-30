output "name_of_aws_s3_bucket_storage_account" {
  value = aws_s3_bucket.bucket.id
}
output "name_of_aws_s3_bucket_acl_value" {
  value = aws_s3_bucket.bucket.acl
}
output "tags_of_aws_s3_bucket" {
  value = aws_s3_bucket.bucket.tags
}
