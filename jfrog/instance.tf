data "aws_ami" "ec2-ami" {
  owners           = ["self"]

  filter {
    name   = "state"
    values = ["available"]
  }
  filter {
    name   = "tag:Name"
    values = ["Packer-JFrog"]
  }
  most_recent = true
}

resource "aws_instance" "jfrog" {
  ami           = "${data.aws_ami.ec2-ami.id}"
  instance_type = "t2.small"
  key_name = "devops-jan"
  security_groups = ["${aws_security_group.jfrog-security.name}"]
  tags = {
    Name = "Packer-JFrog"
  }

  provisioner "file" {
    source      = "script.sh"
    destination = "/home/ubuntu/script.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /home/ubuntu/script.sh",
      "sh /home/ubuntu/script.sh",
    ]
  }

  connection {
    user = "ubuntu"
    private_key = "${file("~/secrets/devops-jan.pem")}"    
  }
}
