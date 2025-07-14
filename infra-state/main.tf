provider "aws" {
  region = var.aws_region
}

# 创建 S3 Bucket 用于 Terraform 状态存储（Free Tier 每月 5GB）
resource "aws_s3_bucket" "tf_state" {
  bucket = var.bucket_name

  versioning {
    enabled = true
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

  lifecycle {
    prevent_destroy = true
  }

  tags = {
    Name        = "TerraformStateBucket"
    Environment = "Dev"
  }
}

# 创建 DynamoDB Table 用于 Terraform 状态锁定
resource "aws_dynamodb_table" "tf_lock" {
  name         = var.lock_table_name
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  lifecycle {
    prevent_destroy = true
  }

  tags = {
    Name        = "TerraformLockTable"
    Environment = "Dev"
  }
}
