resource "aws_internet_gateway" "ecs-vpc-internet-gateway" {
  vpc_id = "${aws_vpc.ecs-vpc.id}"

  tags {
    Name = "ecs-vpc-internet-gateway"
  }
}
