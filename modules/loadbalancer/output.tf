output "load_balancer_ip" {
  value = aws_alb.alb.dns_name
}

output "load_balancer_arn" {
  value = aws_alb.alb.arn
}

output "tg_arn" {
  value = aws_alb_target_group.target_group.arn
}

output "tg_name" {
  value = aws_alb_target_group.target_group.name
}

output "listener_arn" {
  value = aws_alb_listener.http_listener.arn
}