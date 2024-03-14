output "public_ip" {
  value = aws_instance.demo.public_ip
}
output "private_ip" {
    value = aws_instance.demo.private_ip
  
}