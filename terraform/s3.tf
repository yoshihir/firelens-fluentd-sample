resource "aws_s3_bucket" "firelens-fluentd-tfstate" {
  bucket = "firelens-fluentd-terraform-tfstate"
  acl = "private"
  versioning {
    enabled = false
  }
}

resource "aws_s3_bucket" "firelens-fluentd-sample" {
  bucket = "firelens-fluentd-terraform-sample"
  acl = "private"
  versioning {
    enabled = false
  }
}