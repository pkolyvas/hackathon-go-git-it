resource "aws_instance" "hackathon_instance" {

  ami                         = "ami-045137e8d34668746"
  instance_type               = "t3a.small"
  subnet_id                   = module.vpc.public_subnets.0
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.allow_80.id, aws_security_group.allow_443.id, aws_security_group.allow_22.id]
  key_name                    = "grafana_hackathon_rsa"
  disable_api_termination     = false

  tags = {
    Name = "Hackathon Instance"
  }
  volume_tags = {
    Name = "Hackathon Boot"
  }
}


