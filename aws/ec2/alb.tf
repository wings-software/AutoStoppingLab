resource "aws_lb" "alb" {
  count              = var.alb_arn == "" ? 1 : 0
  name               = "${local.name}-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.http.id]
  subnets            = var.subnets
}

resource "aws_lb_target_group" "http" {
  name     = "${local.name}-ec2-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc
}

resource "aws_lb_target_group_attachment" "ec2" {
  target_group_arn = aws_lb_target_group.http.arn
  target_id        = aws_instance.ec2.id
  port             = 80
}

resource "aws_security_group" "http" {
  name        = "${local.name}-alb"
  description = "Security group for whitelisting ports required for EcsSampleApp"
  vpc_id      = var.vpc

  ingress {
    description      = "TLS from VPC"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "default"
  }
}

resource "aws_lb_listener" "ec2" {
  load_balancer_arn = var.alb_arn == "" ? aws_lb.alb[0].arn : var.alb_arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.http.arn
  }
}

resource "aws_lb_listener_rule" "static" {
  listener_arn = aws_lb_listener.ec2.arn
  priority     = 100

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.http.arn
  }

  condition {
    host_header {
      values = ["ec2rule.${local.tags.lb_hostname}"]
    }
  }
}
