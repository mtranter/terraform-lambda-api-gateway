variable "source_file" {
  type        = "string"
  description = "Source file (jar, zip, etc)"
}

variable "function_name" {
  type        = "string"
  description = "Name of the lambda function"
}

variable "function_timeout" {
  type        = "string"
  description = "Timeout in seconds"
  default     = "3"
}

variable "runtime" {
  type        = "string"
  description = "Name of the lambda runtime"
}

variable "handler" {
  type        = "string"
  description = "Name of the lambda handler"
}

variable "role_name" {
  type        = "string"
  description = "Name of the lambda_role"
  default     = ""
}

variable "stage_name" {
  type        = "string"
  description = "The API Gateway Deployment stage"
}

variable "role_policy" {
  type        = "string"
  description = "Lambda role policy"

  default = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": [
          "lambda.amazonaws.com"
        ]
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

variable "rest_api_id" {
  type        = "string"
  description = "Rest Api Id"
}

variable "parent_id" {
  default     = "string"
  description = "API Endpoint parent id"
}

variable "path_part" {
  type        = "string"
  description = "Path of the API Gateway URL"
}

variable "http_method" {
  type        = "string"
  description = "HTTP Method to call API Gateway"
}

variable "authorization" {
  type        = "string"
  description = "API Gateway authorization type"
  default     = "NONE"
}

variable "account_id" {
  type        = "string"
  description = "Account Id"
}

variable "region" {
  type = "string"
}

variable "authorizer_id" {
  type        = "string"
  description = "API Gateway authorization type"
  default     = ""
}

variable "environment_variables" {
  type        = "map"
  default     = {}
  description = "Environment varirables for the Lambda function"
}

variable "subnet_ids" {
  type        = "list"
  description = "Lambda VPC Subnet ids"
  default     = []
}

variable "security_group_ids" {
  type        = "list"
  description = "Lambda VPC security group ids"
  default     = []
}
