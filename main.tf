resource "aws_instance" "one" {
  count                  = 4
  ami                    = "ami-0c02fb55956c7d316"  
  instance_type          = "t3.micro"
  key_name               = "sai key pair"
  vpc_security_group_ids = ["sg-0b41495a016b8f79d"]

  tags = {
    Name = var.instance_names[count.index]
  }
}
