# AWS 区域
variable "aws_region" {
  description = "AWS Region where resources will be created"
  type        = string
}

# 用于 Terraform 状态存储的 S3 bucket 名称（全局唯一）
variable "bucket_name" {
  description = "The name of the S3 bucket to store Terraform state"
  type        = string
}

# 用于锁定 Terraform 状态的 DynamoDB 表名
variable "lock_table_name" {
  description = "The name of the DynamoDB table for state locking"
  type        = string
}
