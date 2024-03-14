output "public_ip" {
  value = aws_instance.Trial.public_ip
}
output "private_ip" {
    value = aws_instance.Trial.private_ip
  
}