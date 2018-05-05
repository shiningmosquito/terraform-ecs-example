resource "aws_ecs_cluster" "ecs_cluster" {
  name = "${var.ecs_cluster_name}"
}

/**
 * ECS Task Definition.
 */
resource "aws_ecs_task_definition" "ecs_task" {
  family                = "${var.ecs_task_family_name}"
  container_definitions = "${file("definitions/example_definition.json")}"
}

/**
 * ECS Service.
 */
resource "aws_ecs_service" "ecs_service" {
  name                               = "${var.ecs_service_name}"
  cluster                            = "${aws_ecs_cluster.ecs_cluster.arn}"
  task_definition                    = "${aws_ecs_task_definition.ecs_task.arn}"
  desired_count                      = "${var.ecs_desired_count}"
  deployment_minimum_healthy_percent = "${var.ecs_minimum_healthy_percent}"
  deployment_maximum_percent         = "${var.maximum_percent}"
  iam_role                           = "${aws_iam_role.ecs_service_role.arn}"

  load_balancer {
    target_group_arn = "${aws_alb_target_group.alb_target_group.arn}"
    container_name   = "${var.ecs_task_container_name}"
    container_port   = "${var.service_container_port}"
  }

  depends_on = ["null_resource.alb_exists", "aws_iam_role.ecs_service_role"]
}
