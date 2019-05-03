data "aws_ami" "ec2-ami" {
  owners           = ["self"]

  filter {
    name   = "state"
    values = ["available"]
  }
  filter {
    name   = "tag:Name"
    values = ["Packer-Jenkins"]
  }
  most_recent = true
}

resource "aws_instance" "jenkins" {
  ami           = "${data.aws_ami.ec2-ami.id}"
  instance_type = "t2.small"
  key_name = "devops-jan"
  security_groups = ["${aws_security_group.jenkins-security.name}"]
  tags = {
    Name = "Packer-Jenkin"
  }
}
