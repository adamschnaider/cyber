resource "aws_vpc_peering_connection" "vpc-peering" {
  peer_vpc_id   = "${aws_vpc.cybereason_terraform_vpc1.id}"
  vpc_id        = "${aws_vpc.cybereason_terraform_vpc2.id}"
  auto_accept   = true

  accepter {
    allow_remote_vpc_dns_resolution = true
  }

  requester {
    allow_remote_vpc_dns_resolution = true
  }
}
