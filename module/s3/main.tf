resource "aws_s3_bucket" "example" {
  bucket = var.bucket_name

  tags = {
    Name        = var.tag_name
    Environment = var.bucket_env
  }
}

resource "aws_s3_bucket_notification" "bucket_notification" {
  bucket = aws_s3_bucket.example.id

  topic {
    topic_arn     = var.sns_arn_for_s3
    events        = var.event_details
    filter_suffix = var.filter_suffix_for_s3
  }
}


