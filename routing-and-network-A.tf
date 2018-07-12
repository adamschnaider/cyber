# Declare the data source
data "aws_availability_zones" "available" {}

/* EXTERNAL NETWORG , IG, ROUTE TABLE */
resource "aws_internet_gateway" "gw_a" {
   vpc_id = "${aws_vpc.cybereason_terraform_vpc1.id}"
    tags {
        Name = "internet gw terraform generated"
    }
}
resource "aws_network_acl" "all_a" {
   vpc_id = "${aws_vpc.cybereason_terraform_vpc1.id}"
    egress {
        protocol = "-1"
        rule_no = 2
        action = "allow"
        cidr_block =  "0.0.0.0/0"
        from_port = 0
        to_port = 0
    }
    ingress {
        protocol = "-1"
        rule_no = 1
        action = "allow"
        cidr_block =  "0.0.0.0/0"
        from_port = 0
        to_port = 0
    }
    tags {
        Name = "open acl"
    }
}
resource "aws_route_table" "public_a" {
  vpc_id = "${aws_vpc.cybereason_terraform_vpc1.id}"
  tags {
      Name = "PublicA"
  }
  route {
        cidr_block = "0.0.0.0/0"
        gateway_id = "${aws_internet_gateway.gw_a.id}"
    }
  route {
	cidr_block = "${var.vpc-fullcidrB}"
	gateway_id = "${aws_vpc_peering_connection.vpc-peering.id}"
    }
}
resource "aws_route_table" "private_a" {
  vpc_id = "${aws_vpc.cybereason_terraform_vpc1.id}"
  tags {
      Name = "PrivateA"
  }
  route {
        cidr_block = "0.0.0.0/0"
        nat_gateway_id = "${aws_nat_gateway.PublicA.id}"
  }
}
resource "aws_eip" "forNatA" {
    vpc      = true
}
resource "aws_nat_gateway" "PublicA" {
    allocation_id = "${aws_eip.forNatA.id}"
    subnet_id = "${aws_subnet.PublicA.id}"
    depends_on = ["aws_internet_gateway.gw_a"]
}
