output "ec2_public_ip" {
  value = aws_instance.Inst1.public_ip
}