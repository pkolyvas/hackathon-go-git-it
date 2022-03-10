resource "aws_security_group" "allow_80" {
  name        = "allow_rdp"
  description = "Allow inbound RDP traffic"
  vpc_id      = module.vpc.vpc_id
  ingress {
    description = "Allow RDP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_80"
  }
}

resource "aws_security_group" "allow_443" {
  name        = "allow_rdp"
  description = "Allow inbound RDP traffic"
  vpc_id      = module.vpc.vpc_id
  ingress {
    description = "Allow RDP"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_443"
  }
}

resource "aws_security_group" "allow_22" {
  name        = "allow_rdp"
  description = "Allow inbound RDP traffic"
  vpc_id      = module.vpc.vpc_id
  ingress {
    description = "Allow RDP"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_443"
  }
}