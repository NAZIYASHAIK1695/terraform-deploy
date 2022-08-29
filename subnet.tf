# creating 1st Public subnet
resource "aws_subnet" "public-subnet-1" {
  vpc_id = "${aws_vpc.myvpc.id}"
  cidr_block = "${var.subnet1_cidr}"
  map_public_ip_on_launch = true
  availability_zone = "us-east-2a"
  tags = {
    Name = "Public Subnet 1"
}
}
# creating 2nd Public subnet
resource "aws_subnet" "public-subnet-2" {
  vpc_id = "${aws_vpc.myvpc.id}"
  cidr_block = "${var.subnet2_cidr}"
  map_public_ip_on_launch = true
  availability_zone = "us-east-2b"
  tags = {
    Name = "Public Subnet 2"
}
}

# Create 1st Private Subnet
resource "aws_subnet" "private-subnet-1" {
  vpc_id = "${aws_vpc.myvpc.id}"
  cidr_block = "${var.subnet3_cidr}"
  map_public_ip_on_launch = true
  availability_zone = "us-east-2a"
  tags = {
    Name = "Private Subnet 1"
}
}
# Create 2nd Private Subnet
resource "aws_subnet" "private-subnet-2" {
  vpc_id = "${aws_vpc.myvpc.id}"
  cidr_block = "${var.subnet4_cidr}"
  map_public_ip_on_launch = true
  availability_zone = "us-east-2b"
  tags = {
    Name = "Private Subnet 2"
}
}
