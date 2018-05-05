resource "aws_vpc" "ecs-vpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = "true"

  tags {
    Name = "ecs-vpc"
  }

  depends_on = ["aws_vpc_dhcp_options.dhcp-options"]
}
