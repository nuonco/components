locals {
  # NLB and target-group names are capped at 32 characters.
  lb_name = substr("${var.cluster_name}-pv", 0, 32)

  # Sandbox list outputs arrive as a Go-rendered string, either comma-delimited
  # ("a,b") or bracketed/space-delimited ("[a b]"); normalize then split.
  public_subnet_ids = split(",", trim(replace(var.public_subnet_ids, " ", ","), "[]"))
}

resource "aws_lb" "sandbox_preview" {
  name               = local.lb_name
  internal           = false
  load_balancer_type = "network"
  subnets            = local.public_subnet_ids
}

resource "aws_lb_target_group" "sandbox_preview" {
  name        = local.lb_name
  port        = var.node_port
  protocol    = "TCP"
  vpc_id      = var.vpc_id
  target_type = "instance"

  proxy_protocol_v2  = false
  preserve_client_ip = false

  health_check {
    protocol = "TCP"
    port     = var.node_port
  }
}

resource "aws_lb_listener" "sandbox_preview" {
  load_balancer_arn = aws_lb.sandbox_preview.arn
  port              = var.listener_port
  protocol          = "TLS"
  certificate_arn   = var.certificate_arn
  ssl_policy        = "ELBSecurityPolicy-TLS13-1-2-2021-06"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.sandbox_preview.arn
  }
}

# The sandbox provisions its nodes through an EKS managed node group, which owns
# the autoscaling group(s). Discover them by the tag EKS applies automatically
# rather than threading the ASG name through the deeply-nested node_groups output.
data "aws_autoscaling_groups" "node_groups" {
  filter {
    name   = "tag:eks:cluster-name"
    values = [var.cluster_name]
  }
}

resource "aws_autoscaling_attachment" "sandbox_preview" {
  for_each = toset(data.aws_autoscaling_groups.node_groups.names)

  autoscaling_group_name = each.value
  lb_target_group_arn    = aws_lb_target_group.sandbox_preview.arn
}

resource "aws_security_group_rule" "preview_nodeport" {
  type              = "ingress"
  from_port         = var.node_port
  to_port           = var.node_port
  protocol          = "tcp"
  cidr_blocks       = [var.vpc_cidr]
  security_group_id = var.cluster_security_group_id
  description       = "Allow NLB to reach sandbox preview NodePort"
}
