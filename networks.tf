provider "aws" {
  shared_credentials_file = "${var.credentialsfile}"
  region     = "${var.region}"
}
resource "aws_vpc" "cybereason_terraform_vpc1" {
    cidr_block = "${var.vpc-fullcidrA}"
    enable_dns_support = true
    enable_dns_hostnames = true
    tags {
      Name = "cybereason-terraform-vpc1"
    }
}
resource "aws_vpc" "cybereason_terraform_vpc2" {
    cidr_block = "${var.vpc-fullcidrB}"
    enable_dns_support = true
    enable_dns_hostnames = true
    tags {
      Name = "cybereason-terraform-vpc2"
    }
}
