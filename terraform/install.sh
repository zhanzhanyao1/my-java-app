#!/bin/bash

set -euxo pipefail
echo "=== user-data script started ===" >> /var/log/user-data.log

# input log
exec > >(tee -a /var/log/user-data.log|logger -t user-data ) 2>&1

echo "Updating system..."
dnf update -y

echo "Installing Docker..."
dnf install -y docker

echo "Starting Docker service..."
systemctl start docker
systemctl enable docker

echo "Adding ec2-user to docker group..."
usermod -aG docker ec2-user

echo "=== user-data script finished ==="