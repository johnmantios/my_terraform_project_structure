terraform {
  backend "s3" {
    region = "my_region"
    bucket = "my_bucket"
    key    = "my_bucket_key"
  }
}
