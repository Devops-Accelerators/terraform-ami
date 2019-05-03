resource "aws_security_group" "selenium-security" {
  name        = "selenium-security"

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress{
    from_port                = 4444
    to_port                  = 4444
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
    Name = "packer-selenium-security"
  }
}
