resource "aws_security_group" "alb_security_group" {
  name        = "${var.security_group_alb}"
  description = "Security Group for ALB."
  vpc_id      = "${aws_vpc.ecs-vpc.id}"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "All HTTP traffic from internet."
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "All HTTPS traffic from internet."
  }

  egress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "All HTTP traffic from internet."
  }

  egress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "All HTTPS traffic from internet."
  }

  tags {
    Name = "alb_security_group"
  }
}

resource "aws_security_group" "ecs_security_group" {
  name        = "${var.security_group_ecs}"
  description = "Security Group for ECS."
  vpc_id      = "${aws_vpc.ecs-vpc.id}"

  ingress {
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = ["${aws_security_group.alb_security_group.id}"]
    description     = "Source from ALB."
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name = "ecs_security_group"
  }

  depends_on = ["aws_security_group.alb_security_group"]
}
