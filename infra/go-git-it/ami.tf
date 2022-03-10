resource "aws_ami_copy" "broadcaster_ca" {
  name              = "zoom-broadcaster"
  description       = "Zoom broadcaster copy for backup"
  source_ami_id     = "ami-07c9a3db578564c24"
  source_ami_region = "ca-central-1"

  tags = {
    Name = "LCEEQ"
  }
}