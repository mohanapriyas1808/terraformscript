module "sns" {
  source                    = "./module/sns"
  sns_topic_name            = "sample-topic"
  is_fifo                   = false
  is_content_duplication    = false
  enable_encryption         = false
  kms_key_id                = "alias/aws/sns"
  s3_arn_for_sns            = module.s3.s3_bucket_arn
  sns_subscription_protocol = "email"
  sns_subscription_endpoint = "mohanaads18@gmail.com"
}

module "s3" {
  source                  = "./module/s3"
  bucket_name             = "today-buc-014-02"
  tag_name                = "my-tod-buc"
  bucket_env              = "dev"
  sns_arn_for_s3          = module.sns.sns_topic_arn
  event_details           = ["s3:ObjectCreated:*", "s3:ObjectRemoved:*"]
  filter_suffix_for_s3    = ".jpeg"
}

