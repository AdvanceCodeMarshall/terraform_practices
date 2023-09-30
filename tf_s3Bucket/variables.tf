variable "s3_bucket_name" {
    type = string
    description = "s3_bucket_name"
    default = "myawsbucket9561178386"
}
variable "region" {
  type = string
  description = "location"
  default = "ap-south-1"
}

variable "acl_value" {
  type = string
  description = "acl_value"
  default = "private"
}