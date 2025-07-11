#!/bin/bash
echo "=== user-data script started ===" >> /var/log/user-data.log

# 输出所有命令日志到日志文件
exec > >(tee -a /var/log/user-data.log|logger -t user-data ) 2>&1

dnf update -y
dnf install -y docker

systemctl start docker
systemctl enable docker

usermod -aG docker ec2-user

echo "=== user-data script finished ===" >> /var/log/user-data.log
