# Create vpc
resource "aws_vpc" "demo" {
    cidr_block = "10.0.0.0/16"
  tags = {
    name = "demo"
  }
}

# Create Internet gateway and attach to vpc
resource "aws_internet_gateway" "demo" {
    vpc_id = aws_vpc.demo.id   # Calling vpc and ataching
  
}

# Create subnets-1
resource "aws_subnet" "pub" {
    vpc_id = aws_vpc.demo.id
    availability_zone = "ap-south-1a"
    cidr_block = "10.0.0.0/24"

}

# Create subnets-2
resource "aws_subnet" "pvt" {
    vpc_id = aws_vpc.demo.id
    availability_zone = "ap-south-1a"
    cidr_block = "10.0.1.0/24"
}

# Create Route table
resource "aws_route_table" "demo" {
    vpc_id = aws_vpc.demo.id
    #Edit routes
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.demo.id

    }
  
}
# Subnet association
resource "aws_route_table_association" "demo" {
    route_table_id = aws_route_table.demo.id
    subnet_id = aws_subnet.pub.id

  
}

# Launch ec2
resource "aws_instance" "demo" {
    ami = var.ami_id
    instance_type = var.instance_type
    key_name = var.key_name
    availability_zone = var.availability_zone
    tags = {
      name = "demo_ec2"
    }
}