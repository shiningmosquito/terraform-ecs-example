resource "aws_vpc_dhcp_options" "dhcp-options" {
  domain_name         = "ap-northeast-1.compute.internal"
  domain_name_servers = ["AmazonProvidedDNS"]

  tags {
    Name = "ecs-dhcp"
  }
}

resource "aws_vpc_dhcp_options_association" "dns_resolver" {
  vpc_id          = "${aws_vpc.ecs-vpc.id}"
  dhcp_options_id = "${aws_vpc_dhcp_options.dhcp-options.id}"

  depends_on = ["aws_vpc_dhcp_options.dhcp-options", "aws_vpc.ecs-vpc"]
}