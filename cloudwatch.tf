/**
 * CloudWatch log group.
 */
resource "aws_cloudwatch_log_group" "cloudwatch_group" {
  name              = "${var.cloudwatch_group}"
  retention_in_days = 60
}