resource "aws_subnet" "PublicA" {
  vpc_id = "${aws_vpc.cybereason_terraform_vpc1.id}"
  cidr_block = "${var.Subnet-Public-A-CIDR}"
  tags {
        Name = "PublicA"
  }
 availability_zone = "${data.aws_availability_zones.available.names[0]}"
}

resource "aws_route_table_association" "PublicA" {
    subnet_id = "${aws_subnet.PublicA.id}"
    route_table_id = "${aws_route_table.public_a.id}"
}

resource "aws_subnet" "PrivateA" {
  vpc_id = "${aws_vpc.cybereason_terraform_vpc1.id}"
  cidr_block = "${var.Subnet-Private-A-CIDR}"
  tags {
        Name = "PrivateA"
  }
  availability_zone = "${data.aws_availability_zones.available.names[0]}"
}

resource "aws_route_table_association" "PrivateA" {
    subnet_id = "${aws_subnet.PrivateA.id}"
    route_table_id = "${aws_route_table.private_a.id}"
}

resource "aws_subnet" "PublicB" {
  vpc_id = "${aws_vpc.cybereason_terraform_vpc2.id}"
  cidr_block = "${var.Subnet-Public-B-CIDR}"
  tags {
        Name = "PublicB"
  }
 availability_zone = "${data.aws_availability_zones.available.names[1]}"
}

resource "aws_route_table_association" "PublicB" {
    subnet_id = "${aws_subnet.PublicB.id}"
    route_table_id = "${aws_route_table.public_b.id}"
}

resource "aws_subnet" "PrivateB" {
  vpc_id = "${aws_vpc.cybereason_terraform_vpc2.id}"
  cidr_block = "${var.Subnet-Private-B-CIDR}"
  tags {
        Name = "PrivateB"
  }
  availability_zone = "${data.aws_availability_zones.available.names[1]}"
}

resource "aws_route_table_association" "PrivateB" {
    subnet_id = "${aws_subnet.PrivateB.id}"
    route_table_id = "${aws_route_table.private_b.id}"
}
