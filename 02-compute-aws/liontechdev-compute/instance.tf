resource "aws_instance" "liontechdev" {
  ami           = var.amis
  instance_type = "t3.micro"
}