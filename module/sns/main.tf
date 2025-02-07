resource "aws_sns_topic" "user_updates" {
  name                        = var.sns_topic_name
  fifo_topic                  = var.is_fifo
  content_based_deduplication = var.is_content_duplication
  kms_master_key_id           = var.enable_encryption ? var.kms_key_id : null
}

data "aws_iam_policy_document" "topic" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["s3.amazonaws.com"]
    }

    actions   = ["SNS:Publish"]
    resources = [aws_sns_topic.user_updates.arn]

    condition {
      test     = "ArnLike"
      variable = "aws:SourceArn"
      values   = [var.s3_arn_for_sns]
    }
  }
}

resource "aws_sns_topic_policy" "sns_topic_policy" {
  arn    = aws_sns_topic.user_updates.arn
  policy = data.aws_iam_policy_document.topic.json
}

resource "aws_sns_topic_subscription" "email_subscription" {
  topic_arn = aws_sns_topic.user_updates.arn
  protocol  = var.sns_subscription_protocol
  endpoint  = var.sns_subscription_endpoint
}
