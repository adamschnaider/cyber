resource "aws_instance" "serv2" {
  ami           = "${lookup(var.AmiLinux, var.region)}"
  instance_type = "t2.micro"
  associate_public_ip_address = "false"
  subnet_id = "${aws_subnet.PrivateB.id}"
  vpc_security_group_ids = ["${aws_security_group.FrontEndB.id}"]
  key_name = "${var.key_name}"
  tags {
        Name = "serv2"
  }
#  provisioner "local-exec" {
#    command = "sleep 200 && ping -c 10 ${aws_instance.serv1.private_ip} > env_vars.txt"
#  }
}
resource "aws_instance" "serv1" {
  ami           = "${lookup(var.AmiLinux, var.region)}"
  instance_type = "t2.micro"
  associate_public_ip_address = "true"
  subnet_id = "${aws_subnet.PublicA.id}"
  vpc_security_group_ids = ["${aws_security_group.FrontEndA.id}"]
  key_name = "${var.key_name}"
  tags {
        Name = "serv1"
  }
  provisioner "remote-exec" {
	connection {
        type = "ssh"
#       agent = false
        timeout = "200s"
        user = "ec2-user"
        private_key = "${file(var.key-path)}"
    }
	inline = ["sleep 200","/bin/ping -c 10 ${aws_instance.serv2.private_ip} > env_vars.txt" ]
  }
}

/*
data "template" "user_data" {
  template = "${file("scripts/user_data.tpl")}"

  vars {
    master_ip = "${aws_instance.serv1.private_ip}"
  }
}
*/
