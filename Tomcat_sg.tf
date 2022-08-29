# creating Security Group
resource "aws_security_group" "tomcat_sg" {
  vpc_id = "${aws_vpc.myvpc.id}"
# Inbound Rules

# custom tcp access from anywhere
  ingress {
    from_port = 8080
    
    to_port = 8080
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
}

# SSH access from anywhere
ingress {
  from_port = 22
  to_port = 22
  protocol = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
}
# Outbound Rules

# Internet access to anywhere
egress {
  from_port = 0
  to_port = 0
   protocol = "-1"
  cidr_blocks = ["0.0.0.0/0"]
}
  tags = {
    Name = "Tomcat_SG"
}
}
                                  