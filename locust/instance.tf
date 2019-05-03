data "aws_ami" "ec2-ami" {
  owners           = ["self"]

  filter {
    name   = "state"
    values = ["available"]
  }
  filter {
    name   = "tag:Name"
    values = ["Packer-Locust"]
  }
  most_recent = true
}

resource "aws_instance" "locust" {
  ami           = "${data.aws_ami.ec2-ami.id}"
  instance_type = "t2.small"
  key_name = "devops-jan"
  security_groups = ["${aws_security_group.locust-security.name}"]
  tags = {
    Name = "Packer-Locust"
  }
}
