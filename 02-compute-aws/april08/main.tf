resource "aws_instance" "liontech-demo2" {

  ami                   = var.ami
  instance_type          = "t2.micro"
  availability_zone      = var.zone1
  key_name               = "april08a"
  vpc_security_group_ids = ["sg-09d241c645ceacc0c"]  

  tags = {

    Name     = "Liontech-april08"
    Team     = "devops team"
    client   = "bmo"
    Teamlead = "Issabel"
    Manager  = "Bengamin"
  }
}