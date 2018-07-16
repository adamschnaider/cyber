variable "region" {
  default = "us-west-2"
}
variable "AmiLinux" {
  type = "map"
  default = {
    us-east-1 = "ami-b73b63a0" # Virginia
    us-west-2 = "ami-5ec1673e" # Oregon
    eu-west-1 = "ami-9398d3e0" # Ireland
    us-east-2 = "ami-ea87a78f" # Ohio
  }
}

variable "credentialsfile" {
  default = "/home/ec2-user/.aws/credentials"
  description = "where access and secret_key are stored"
}

variable "vpc-fullcidrA" {
    default = "172.28.0.0/16"
  description = "the vpc cdir"
}
variable "Subnet-Public-A-CIDR" {
  default = "172.28.0.0/24"
  description = "the cidr of the subnet"
}
variable "Subnet-Private-A-CIDR" {
  default = "172.28.3.0/24"
  description = "the cidr of the subnet"
}
variable "vpc-fullcidrB" {
    default = "210.29.0.0/16"
  description = "the vpc cdir"
}
variable "Subnet-Public-B-CIDR" {
  default = "210.29.0.0/24"
  description = "the cidr of the subnet"
}
variable "Subnet-Private-B-CIDR" {
  default = "210.29.3.0/24"
  description = "the cidr of the subnet"
}

variable "key_name" {
  default = "ELK stack"
  description = "the ssh key to use in the EC2 machines"
}
variable "DnsZoneName" {
  default = "cybereason.terraform.internal"
  description = "the internal dns name"
}

variable "key-path" {
  default = "/home/ec2-user/ELKstack.pem"
  description = "Key location for remote-exec"
}
