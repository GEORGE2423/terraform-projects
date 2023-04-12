output "sg_id" {
   description = "The ID of the security group"
   value = aws_security_group.ltech_jenkins_sg.id
}