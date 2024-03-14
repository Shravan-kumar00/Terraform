resource "aws_instance" "Trial" {
    ami = var.ami_id
    instance_type = var.instance_type
    availability_zone = var.availability_zone
    key_name = var.key_name
    tags = {
      name = "Trial"
    }
  
}