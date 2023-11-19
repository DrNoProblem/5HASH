
data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"]
}

resource "aws_instance" "webserver" {
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = var.ec2_instance
  key_name               = aws_key_pair.ssh-connection.key_name
  vpc_security_group_ids = [aws_security_group.ssh.id]
  tags = {
    "Name" = var.ec2_name
  }
}

