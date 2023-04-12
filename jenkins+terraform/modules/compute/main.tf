variable "security_group" {
   description = "The security groups assigned to the Jenkins server"
}

variable "public_subnet" {
   description = "The public subnet IDs assigned to the Jenkins server"
}

resource "aws_instance" "jenkins_server" {
   ami = "ami-05803413c51f242b7"                 #"${data.aws_ami.ubuntu.id}"
   subnet_id = var.public_subnet
   instance_type = "t2.2xlarge"
   vpc_security_group_ids = [var.security_group]
   key_name = aws_key_pair.ltech.key_name
   user_data = "${file("${path.module}/install_jenkins.sh")}"

   tags = {
      Name = "jenkins_server"
      Teams = "devops"
      Client = "liontechacademy"
   }
}

resource "aws_key_pair" "ltech" {
   key_name = "ltech.pem"
   public_key = file("${path.module}/ltech.pub")
}

resource "aws_eip" "jenkins_eip" {
   instance = aws_instance.jenkins_server.id
   vpc      = true

   tags = {
      Name = "jenkins_eip"
   }
}
