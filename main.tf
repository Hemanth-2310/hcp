provider "aws" {
  region = "us-east-1"
}

variable "instance_names" {
  type    = list(string)
  default = ["jenkins", "tomcat-1", "tomcat-2", "monitoring-server"]
}

resource "aws_instance" "one" {
  count                  = 4
  ami                    = "ami-03695d52f0d883f65"
  instance_type          = "t2.micro"
  key_name               = "saikeypair"
  vpc_security_group_ids = ["sg-0b41495a016b8f79d"]

  tags = {
    Name = var.instance_names[count.index]
  }
}
