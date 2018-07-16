# Declare the data source
#data "aws_availability_zones" "available" {}

/* EXTERNAL NETWORG , IG, ROUTE TABLE */
/*
resource "aws_internet_gateway" "gw_b" {
   vpc_id = "${aws_vpc.cybereason_terraform_vpc2.id}"
    tags {
        Name = "internet gw terraform generated"
    }
}
*/
resource "aws_network_acl" "all_b" {
   vpc_id = "${aws_vpc.cybereason_terraform_vpc2.id}"
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
/*
resource "aws_route_table" "public_b" {
  vpc_id = "${aws_vpc.cybereason_terraform_vpc2.id}"
  tags {
      Name = "PublicB"
  }
  route {
        cidr_block = "0.0.0.0/0"
        gateway_id = "${aws_internet_gateway.gw_b.id}"
    }
}
*/
resource "aws_route_table" "private_b" {
  vpc_id = "${aws_vpc.cybereason_terraform_vpc2.id}"
  tags {
      Name = "PrivateB"
  }
 # route {
 #       cidr_block = "0.0.0.0/0"
 #       nat_gateway_id = "${aws_nat_gateway.PublicB.id}"
 # }
  route {
        cidr_block = "${var.vpc-fullcidrA}"
        gateway_id = "${aws_vpc_peering_connection.vpc-peering.id}"
  }

}
resource "aws_eip" "forNatB" {
    vpc      = true
}
/*
resource "aws_nat_gateway" "PublicB" {
    allocation_id = "${aws_eip.forNatB.id}"
    subnet_id = "${aws_subnet.PublicB.id}"
    depends_on = ["aws_internet_gateway.gw_b"]
}
*/
