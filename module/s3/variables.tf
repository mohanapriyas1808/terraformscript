variable "bucket_name"{
    description = "Name of the bucket"
    type = string
}
variable "tag_name"{
    description = "tage name for s3"
    type = string
    
}
variable "bucket_env"{
    description = "bucket environment"
    type = string
    
}
variable "sns_arn_for_s3" {
  description = "ARN of the SNS topic"
  type        = string
}


variable "event_details"{
    description = "s3 events"
    type = list(string)
}

variable "filter_suffix_for_s3"{
    description = "filter suffix value"
    type = string 
}
