resource "aws_instance" "example" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  key_name                    = var.key_name
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.allow_ssh_http.id]
  user_data                   = file("${path.module}/install.sh")

  tags = {
    Name        = "MyJavaAppInstance"
    Environment = "Dev"
  }
}

resource "aws_security_group" "allow_ssh_http" {
  name        = "allow_ssh_http_prometheus"
  description = "SSH/HTTP/Prometheus"

  # 允许SSH访问（端口22），生产环境建议限制CIDR
  ingress {
    description      = "SSH"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"] # 这里建议改为你的固定IP或内网CIDR，提升安全性
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    security_groups  = []
    self             = false
  }

  # 允许HTTP访问（端口80），用于Web服务
  ingress {
    description      = "HTTP"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    security_groups  = []
    self             = false
  }

  # 允许Prometheus访问（端口9090），用于监控UI和抓指标
  ingress {
    description      = "Prometheus"
    from_port        = 9090
    to_port          = 9090
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"] # 生产环境同样建议限制访问IP范围
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    security_groups  = []
    self             = false
  }

  # 允许本地调试(8080)
  ingress {
    description      = "Local"
    from_port        = 8080
    to_port          = 8080
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"] # 生产环境同样建议限制访问IP范围
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    security_groups  = []
    self             = false
  }

  # 出站规则，允许所有流量出去
  egress {
    description      = "All"
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    security_groups  = []
    self             = false
  }

  tags = {
    Name        = "Allow SSH, HTTP, Prometheus"
    Environment = "Dev"
  }
}
