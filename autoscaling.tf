/**
 * Launch configuration for autoscaling group.
 */
resource "aws_launch_configuration" "launch_configuration" {
  name                 = "${var.launch_configuration}"
  image_id             = "${lookup(var.amis, "ap-northeast-1")}"
  instance_type        = "${var.instance_type}"
  security_groups      = ["${aws_security_group.ecs_security_group.id}"]
  iam_instance_profile = "${aws_iam_instance_profile.instance_profile.name}"
  user_data            = "#!/bin/bash\necho ECS_CLUSTER=${aws_ecs_cluster.ecs_cluster.name} >> /etc/ecs/ecs.config"

  depends_on = ["aws_iam_instance_profile.instance_profile", "aws_security_group.ecs_security_group"]
}

/**
 * Autoscaling group.
 */
resource "aws_autoscaling_group" "autoscaling_group" {
  name                      = "${var.auto_scaling_group_name}"
  vpc_zone_identifier       = ["${aws_subnet.ecs-vpc-subnet1.id}", "${aws_subnet.ecs-vpc-subnet2.id}"]
  launch_configuration      = "${aws_launch_configuration.launch_configuration.name}"
  health_check_grace_period = 0
  min_size                  = 0
  max_size                  = 2
  desired_capacity          = 2

  tag {
    key                 = "Name"
    value               = "ECS"
    propagate_at_launch = true
  }

  depends_on = ["aws_subnet.ecs-vpc-subnet1", "aws_subnet.ecs-vpc-subnet2"]
}
