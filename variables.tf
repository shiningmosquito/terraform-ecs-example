variable aws_access_key {
  description = "AWS access key."
}

variable aws_secret_key {
  description = "AWS secret key."
}
/* ECS optimized AMIs per region */
variable "amis" {
  description = "ECS-optimized AMI amzn-ami-2017.09.k-amazon-ecs-optimized list."

  default = {
    us-east-1      = "ami-cb17d8b6"
    us-east-2      = "ami-1b90a67e"
    us-west-1      = "ami-9cbbaffc"
    us-west-2      = "ami-05b5277d"
    eu-west-1      = "ami-bfb5fec6"
    eu-west-2      = "ami-a48d6bc3"
    eu-west-3      = "ami-914afcec"
    eu-central-1   = "ami-ac055447"
    ap-northeast-1 = "ami-5add893c"
    ap-northeast-2 = "ami-ba74d8d4"
    ap-southeast-1 = "ami-acbcefd0"
    ap-southeast-2 = "ami-4cc5072e"
    ca-central-1   = "ami-a535b2c1"
    ap-south-1     = "ami-2149114e"
    sa-east-1      = "ami-d3bce9bf"
  }
}

variable "instance_type" {
  description = "ECS Instance Type"
  default     = "t2.micro"
}

variable "acm_certificate_arn" {
  description = "ACM Certificate Arn"

  default     = "arn:aws:acm:ap-northeast-1:xxxxxxxxxxxx:certificate/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
}

variable "ssl_certificate" {
  description = "ALB SSL Certificate list."
  type        = "map"

  default = {
    TLS-1-0      = "ELBSecurityPolicy-TLS-1-0-2015-04"
    TLS-1-1      = "ELBSecurityPolicy-TLS-1-1-2017-01"
    TLS-1-2      = "ELBSecurityPolicy-TLS-1-2-2017-01"
    Security2015 = "ELBSecurityPolicy-2015-05"
    Security2016 = "ELBSecurityPolicy-2016-08"
  }
}

variable "launch_configuration" {
  description = "Lanuch Configuration Name."
  default     = "ecs-launch-configuration"
}

variable "alb_target_group" {
  description = "Target Group Name."
  default     = "ecs-alb-target-group"
}

variable "alb_name" {
  description = "ALB Name."
  default     = "ecs-ALB"
}

variable "security_group_ecs" {
  description = "Security Group Name of ECS Cluster"
  default     = "ecs-securitygroup-ecs"
}

variable "security_group_alb" {
  description = "Security Group Name of ALB"
  default     = "ecs-securitygroup-alb"
}

variable "ecs_desired_count" {
  description = "Desired tasks of ECS Service."
  default     = "2"
}

variable "ecs_minimum_healthy_percent" {
  description = "Minimum healthy percent of ECS Service."
  default     = "50"
}

variable "maximum_percent" {
  description = "Maximum percent of ECS Service."
  default     = "100"
}

variable "route53_endpoint" {
  description = "Endpoint for Route53."
  default     = "terraform.example.com"
}

variable "ecs_cluster_name" {
  description = "The name of the ECS cluster."
  default     = "ecs-Cluster"
}

variable "service_container_port" {
  description = "Service application running port of container."

  default = 8080
}

variable "service_host_port" {
  description = "Service application running port of host."

  default = 80
}

variable "auto_scaling_group_name" {
  description = "Auto scaling group name."

  default = "ecs-AutoScalingGroup"
}

variable "ecs_service_name" {
  description = "Services name of ECS Cluster."

  default = "ecs-service"
}

variable "ecs_task_container_name" {
  description = "Container name of ECS task."

  default = "ecs-container"
}

variable "ecs_task_family_name" {
  description = "ECS Task Definition name."
  default     = "ecs-task"
}

variable "route53_public_zoneid" {
  description = "Zone ID of Route53 public hosted zone."

  default     = "xxxxxxxxxxxxx"
}

variable "cloudwatch_group" {
  description = "CloudWatch log group for ECS Task."
  default     = "ecs-cloudwatch-log-group"
}
