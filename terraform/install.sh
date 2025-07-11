#!/bin/bash
set -euxo pipefail

echo "=== user-data script started ===" >> /var/log/user-data.log

# 更新系统
yum update -y

# 安装 Docker
amazon-linux-extras enable docker
yum install -y docker

# 启动 Docker 并设置为开机启动
systemctl start docker
systemctl enable docker

# 添加当前用户到 docker 组（重启后生效）
usermod -aG docker ec2-user

# 确保 Docker 启动完成
sleep 3

echo "=== user-data script finished ===" >> /var/log/user-data.log