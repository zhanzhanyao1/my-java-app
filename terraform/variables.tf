variable "aws_region" {
  description = "AWS 区域"
  type        = string
}

variable "instance_type" {
  description = "EC2 实例类型"
  type        = string
  default     = "t2.micro"
}

variable "ami_id" {
  description = "AMI 镜像 ID"
  type        = string
}

variable "key_name" {
  description = "用于 SSH 登录的 Key Pair 名称"
  type        = string
}

variable "private_key_path" {
  description = "Path to the SSH private key"
  type        = string
}
