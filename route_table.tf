resource "aws_route_table" "ecs-vpc-route-table" {
  vpc_id = "${aws_vpc.ecs-vpc.id}"

  route {
    cidr_block = "10.0.0.0/0"
    gateway_id = "${aws_internet_gateway.ecs-vpc-internet-gateway.id}"
  }

  tags {
    Name = "ecs-vpc-route-table"
  }
}

resource "aws_route_table_association" "ecs-vpc-route-table-association1" {
  subnet_id      = "${aws_subnet.ecs-vpc-subnet1.id}"
  route_table_id = "${aws_route_table.ecs-vpc-route-table.id}"
}

resource "aws_route_table_association" "ecs-vpc-route-table-association2" {
  subnet_id      = "${aws_subnet.ecs-vpc-subnet2.id}"
  route_table_id = "${aws_route_table.ecs-vpc-route-table.id}"
}
