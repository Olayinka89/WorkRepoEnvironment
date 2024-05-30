variable "lambda_function_name" {
  description = "The name of the Lambda function"
  type        = string
}

variable "s3_bucket" {
  description = "The S3 bucket to store Lambda function code"
  type        = string
}

variable "s3_key" {
  description = "The S3 key for Lambda function code"
  type        = string
}