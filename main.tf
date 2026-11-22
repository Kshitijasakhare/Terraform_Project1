resource "aws_instance" "Inst1" {
  ami                         = "ami-083cf4acad89c8905"
  instance_type               = "t3.small"
  subnet_id                   = aws_subnet.sub1.id
  associate_public_ip_address = true
  key_name                    = "mumkey2"
  availability_zone           = "ap-south-1a"
  vpc_security_group_ids      = [aws_security_group.sg.id]
  user_data                   = file("jenkins.sh")
  tags = {
    Name = "Inst1"
  }
}
resource "aws_s3_bucket" "buck1" {
  bucket = "kshitijaatul134748917507"

  tags = {
    Name = "buck1"
  }
}

resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.buck1.id

  versioning_configuration {
    status = "Enabled"
  }
}
