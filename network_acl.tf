resource "aws_network_acl" "ecs-vpc-network-acl" {
  vpc_id     = "${aws_vpc.ecs-vpc.id}"
  subnet_ids = ["${aws_subnet.ecs-vpc-subnet1.id}", "${aws_subnet.ecs-vpc-subnet2.id}"]

  egress {
    protocol   = "-1"
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }

  ingress {
    protocol   = "-1"
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }

  tags {
    Name = "ecs-vpc-network-acl"
  }
}
