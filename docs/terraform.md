## Terraform 是什么？
Terraform 是由 HashiCorp 开发的**基础设施即代码（Infrastructure as Code, IaC）**工具，允许你使用声明式配置文件来定义和管理云基础设施，如 AWS、GCP、Azure 等。
1. 跨平台支持：不仅限于 AWS，也支持 GCP、Azure、Kubernetes、GitHub、Datadog 等数百个 provider。
2. 声明式语法：你只需描述“你想要的状态”，Terraform 会自动比较现有状态并进行最小化变更。
3. 可追溯版本控制：配置文件是纯文本，适合 Git 管理，适合 DevOps 流程。
4. 资源追踪状态管理：自动记录资源的状态（state），你可以随时恢复、删除或修改资源。

## Terraform 搭建 AWS EC2 实例的最佳实践

| 项                                   | 原因                   |
| ----------------------------------- | -------------------- |
| 模块化结构                               | 便于扩展，如添加 RDS、S3、安全组等 |
| 使用 `terraform.tfvars` 管理变量          | 防止硬编码，提高可维护性         |
| 使用 `remote backend`（可选）             | 在团队协作中管理共享状态         |
| 明确分离 `provider`、`resource`、`output` | 清晰可读，便于排错和管理         |
| 添加 `tags`                           | 为资源分类，方便成本分析、安全审计    |


## 完整文件结构
```
terraform/
├── main.tf              # 主要资源定义（EC2、VPC、安全组等）
├── variables.tf         # 所有变量的定义
├── terraform.tfvars     # 变量值定义（私密信息别上传 Git）
├── outputs.tf           # 输出资源信息（如 EC2 的公网 IP）
├── provider.tf          # AWS 认证与区域设置
```

## 每个文件详解
1️⃣ provider.tf
```
provider "aws" {
  region  = var.aws_region
  profile = var.aws_profile  # 你本地配置好的 AWS CLI profile（例如：default）
}
```
2️⃣ variables.tf

```
variable "aws_region" {
type        = string
description = "AWS 区域"
}

variable "aws_profile" {
type        = string
description = "AWS CLI 配置的 Profile 名"
}

variable "instance_type" {
type        = string
description = "EC2 实例类型"
default     = "t2.micro"
}

variable "ami_id" {
type        = string
description = "Amazon Machine Image ID"
}

variable "key_name" {
type        = string
description = "用于 SSH 登录的密钥对名称"
}
```
3️⃣ terraform.tfvars（不要上传 Git，可添加到 .gitignore）
```
aws_region   = "us-east-1"
aws_profile  = "default"
instance_type = "t2.micro"
ami_id       = "ami-0c55b159cbfafe1f0"  # 根据你的区域更新
key_name     = "your-key-pair-name"     # 你本地生成的 SSH 密钥对
```
4️⃣ main.tf
```
resource "aws_instance" "web" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  key_name               = var.key_name
  associate_public_ip_address = true

  tags = {
    Name = "Terraform-EC2"
    Environment = "Dev"
  }

  # 安全组可以内嵌或单独定义
  vpc_security_group_ids = [aws_security_group.allow_ssh_http.id]
}

resource "aws_security_group" "allow_ssh_http" {
  name        = "allow_ssh_http"
  description = "Allow SSH and HTTP"
  ingress = [
    {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    },
    {
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]
  egress = [
    {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]
}

```
5️⃣ outputs.tf
```
output "instance_ip" {
  description = "EC2 公网 IP 地址"
  value       = aws_instance.web.public_ip
}
```
## 运行步骤


```
cd terraform

# 初始化 Terraform
terraform init

# 可选：查看执行计划
terraform plan

# 应用配置，创建资源
terraform apply

# 删除资源（可选）
terraform destroy
```


## 安全注意事项
1. .tfvars 文件不要提交 Git，使用 .gitignore 保护 
2. 如果多人协作，建议使用 S3 作为 remote backend 存储状态文件 
3. 密钥文件（如 SSH 私钥）不要放入 Terraform 目录

## 下一步建议
1. 使用 module 拆分不同组件（如网络、计算、安全） 
2. 使用 remote backend 存储状态 
3. 配合 GitHub Actions 自动执行 terraform apply 
4. 集成资源如： RDS（MySQL/PostgreSQL） ALB（负载均衡器） S3（静态网站或文件存储）