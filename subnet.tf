resource "aws_subnet" "ecs-vpc-subnet1" {
  vpc_id                  = "${aws_vpc.ecs-vpc.id}"
  cidr_block              = "10.0.0.0/24"
  availability_zone       = "ap-northeast-1a"
  map_public_ip_on_launch = true

  tags {
    Name = "ecs-vpc-subnet-public-1a"
  }
}

resource "aws_subnet" "ecs-vpc-subnet2" {
  vpc_id                  = "${aws_vpc.ecs-vpc.id}"
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "ap-northeast-1c"
  map_public_ip_on_launch = true

  tags {
    Name = "ecs-vpc-subnet-public-1c"
  }
}
