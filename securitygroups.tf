resource "aws_security_group" "FrontEndA" {
  name = "FrontEndA"
  tags {
        Name = "FrontEndA"
  }
  description = "SSH CONNECTION INBOUD"
  vpc_id = "${aws_vpc.cybereason_terraform_vpc1.id}"

  ingress {
    from_port   = "22"
    to_port     = "22"
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "FrontEndB" {
  name = "FrontEndB"
  tags {
        Name = "FrontEndB"
  }
  description = "SSH CONNECTION INBOUD"
  vpc_id = "${aws_vpc.cybereason_terraform_vpc2.id}"

  ingress {
    from_port   = "-1"
    to_port     = "-1"
    protocol    = "icmp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
