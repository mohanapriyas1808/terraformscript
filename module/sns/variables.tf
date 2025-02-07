


variable "sns_topic_name"{
    description = "name of the topic"
    type = string
  
}

variable "is_fifo"{
    description = "if needed a fifo topic"
    type = bool
    
}
variable "is_content_duplication"{
    description = "if needed a content duplication"
    type = bool
    
}
variable "enable_encryption"{
    description = "if needed encryption"
    type = bool
    
}
variable "kms_key_id"{
    description = "default kms key"
    type = string
   
}
variable "s3_arn_for_sns" {
  description = "The ARN of the S3 bucket for SNS"
  type        = string
}
variable "sns_subscription_protocol"{
    description = "subscription protocol"
    type = string
    
}

variable "sns_subscription_endpoint"{
    description = "subscription endpoint"
    type = string
   
}


