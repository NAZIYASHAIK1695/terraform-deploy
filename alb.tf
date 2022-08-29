resource "aws_lb" "external-elb" {
  name               = "External-LB"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.tomcat_sg.id]
  subnets            = [aws_subnet.public-subnet-1.id, aws_subnet.public-subnet-2.id]
}

resource "aws_lb_target_group" "external-elb" {
  name     = "ALB-TG"
  port     = 8080
  protocol = "TCP"
  vpc_id   = aws_vpc.myvpc.id
}

resource "aws_lb_target_group_attachment" "external-elb" {
  target_group_arn = aws_lb_target_group.external-elb.arn
  target_id        = aws_instance.publicinstance1.id
  port             = 8080

  depends_on = [
    aws_instance.publicinstance1,
  ]
}

resource "aws_lb_target_group" "external-elb1" {
  name     = "ALB-TG"
  port     = 8080
  protocol = "TCP"
  vpc_id   = aws_vpc.myvpc.id
}
resource "aws_lb_target_group_attachment" "external-elb1" {
  target_group_arn = aws_lb_target_group.external-elb1.arn
  target_id        = aws_instance.publicinstance2.id
  port             = 8080

  depends_on = [
    aws_instance.publicinstance2,
  ]
}

resource "aws_lb_listener" "external-elb" {
  load_balancer_arn = aws_lb.external-elb.arn
  port              = "8080"
  protocol          = "TCP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.external-elb.arn
  }
}
