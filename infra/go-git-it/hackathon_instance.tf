resource "aws_instance" "hackathon_instance" {

  ami                         = "ami-045137e8d34668746"
  instance_type               = "t3.medium"
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

resource "aws_ebs_volume" "hackathon_data" {
  availability_zone = "ca-central-1a"
  size              = 32
  type = "gp2"
  tags = {
    Name = "Hackathon Data"
  }
}

resource "aws_volume_attachment" "hackathon_data_attachement" {
  device_name = "/dev/sdh"
  volume_id   = aws_ebs_volume.hackathon_data.id
  instance_id = aws_instance.hackathon_instance.id
