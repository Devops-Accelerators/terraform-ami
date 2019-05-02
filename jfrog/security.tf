resource "aws_security_group" "jfrog-security" {
  name        = "jenkins-security"

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress{
    from_port                = 8081
    to_port                  = 8081
    protocol                 = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress{
    from_port                = 22
    to_port                  = 22
    protocol                 = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }


  tags = {
    Name = "packer-jfrog-security"
  }
}
