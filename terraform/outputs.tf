output "instance_id" {
  value       = aws_instance.example.id
  description = "EC2 实例 ID"
}

output "public_ip" {
  value       = aws_instance.example.public_ip
  description = "EC2 公网 IP"
}
