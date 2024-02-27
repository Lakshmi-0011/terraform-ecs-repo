resource "aws_security_group" "lb" {
  name        = "example-alb-security-group"
  vpc_id      = var.vpc_id

  ingress {
    protocol    = "tcp"
    from_port   = 80
    to_port     = 80
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 0
    to_port   = 0
    protocol  = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_alb" "alb" {
  name               = var.name
  subnets            = var.public_subnet_ids
  security_groups    = [aws_security_group.lb.id]
  load_balancer_type = "application"
  internal           = false
}

resource "aws_alb_listener" "http_listener" {
  load_balancer_arn = aws_alb.alb.id
  port              = "80"
  protocol          = "HTTP"

  default_action {
    target_group_arn = var.target_group
    type             = "forward"
  }
}

resource "aws_alb_target_group" "target_group" {
  name                 = var.tg_name
  port                 = var.port
  protocol             = var.protocol
  vpc_id               = var.vpc_id
  target_type          = var.tg_type
}