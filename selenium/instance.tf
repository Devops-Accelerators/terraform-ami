data "aws_ami" "ec2-ami" {
  owners           = ["self"]

  filter {
    name   = "state"
    values = ["available"]
  }
  filter {
    name   = "tag:Name"
    values = ["Packer-Selenium"]
  }
  most_recent = true
}

resource "aws_instance" "selenium" {
  ami           = "${data.aws_ami.ec2-ami.id}"
  instance_type = "t2.small"
  key_name = "devops-jan"
  security_groups = ["${aws_security_group.selenium-security.name}"]
  tags = {
    Name = "Packer-Selenium"
  }

  provisioner "file" {
    source      = "seleniumStart.sh"
    destination = "/home/ubuntu/seleniumStart.sh"
  }
  
  provisioner "remote-exec" {
    inline = [
      "chmod +x /home/ubuntu/seleniumStart.sh",
      "sh /home/ubuntu/seleniumStart.sh",
    ]
  }

  connection {
    user = "ubuntu"
    private_key = "${file("~/secrets/devops-jan.pem")}"    
  }
}
