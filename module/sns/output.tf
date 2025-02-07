output "sns_topic_arn"{
    description = "ARN of the topic"
    value = aws_sns_topic.user_updates.arn
}