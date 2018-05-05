/**
 * External ALB.
 */
resource "aws_alb" "alb" {
  name                       = "${var.alb_name}"
  internal                   = false
  security_groups            = ["${aws_security_group.alb_security_group.id}"]
  subnets                    = ["${aws_subnet.ecs-vpc-subnet1.id}", "${aws_subnet.ecs-vpc-subnet2.id}"]
  enable_deletion_protection = false

  depends_on = ["aws_security_group.alb_security_group"]
}

/**
 * ALB Target Group.
 */
resource "aws_alb_target_group" "alb_target_group" {
  name                 = "${var.alb_target_group}"
  port                 = "${var.service_host_port}"
  protocol             = "HTTP"
  vpc_id               = "${aws_vpc.ecs-vpc.id}"
  deregistration_delay = 0

  health_check {
    protocol            = "HTTP"
    path                = "/"
    port                = "traffic-port"
    healthy_threshold   = 3
    unhealthy_threshold = 2
    timeout             = 10
    interval            = 15
    matcher             = "200"
  }

  depends_on = ["aws_alb.alb"]
}

resource "null_resource" "alb_exists" {
  triggers {
    alb_name = "${aws_alb.alb.arn}"
  }
}

/**
 * ALB listener.
 */
resource "aws_lb_listener" "alb_listener_https" {
  load_balancer_arn = "${aws_alb.alb.arn}"
  port              = 443
  protocol          = "HTTPS"
  ssl_policy        = "${lookup(var.ssl_certificate, "Security2016")}"
  certificate_arn   = "${var.acm_certificate_arn}"

  default_action {
    target_group_arn = "${aws_alb_target_group.alb_target_group.arn}"
    type             = "forward"
  }

  depends_on = ["aws_alb.alb"]
}

resource "aws_lb_listener" "alb_listener_http" {
  load_balancer_arn = "${aws_alb.alb.arn}"
  port              = 80
  protocol          = "HTTP"

  default_action {
    target_group_arn = "${aws_alb_target_group.alb_target_group.arn}"
    type             = "forward"
  }

  depends_on = ["aws_alb.alb"]
}
