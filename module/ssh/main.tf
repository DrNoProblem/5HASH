resource "tls_private_key" "ssh-key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}
resource "aws_key_pair" "ssh-connection" {
  key_name   = "ssh-conenction"
  public_key = tls_private_key.ssh-key.public_key_openssh
}