resource "aws_iam_role" "ecs_instance_role" {
  name               = "ecs_instance_role"
  assume_role_policy = "${file("assume_role_policy/assume_instance.json")}"
}

resource "aws_iam_instance_profile" "instance_profile" {
  name = "${aws_iam_role.ecs_instance_role.name}"
  role = "${aws_iam_role.ecs_instance_role.name}"
  path = "/"

  depends_on = ["aws_iam_role.ecs_instance_role"]
}

resource "aws_iam_role_policy_attachment" "ecs_instance_role_attach" {
  role       = "${aws_iam_role.ecs_instance_role.name}"
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEC2ContainerServiceforEC2Role"

  depends_on = ["aws_iam_role.ecs_instance_role"]
}

resource "aws_iam_role" "ecs_service_role" {
  name               = "ecs_service_role"
  assume_role_policy = "${file("assume_role_policy/assume_service.json")}"
}

resource "aws_iam_role_policy_attachment" "ecs_service_role_attach" {
  role       = "${aws_iam_role.ecs_service_role.name}"
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEC2ContainerServiceRole"

  depends_on = ["aws_iam_role.ecs_service_role"]
}