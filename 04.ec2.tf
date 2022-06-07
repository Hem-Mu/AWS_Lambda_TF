/* data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
} Template is Lazy to use*/

resource "aws_instance" "web" {
  ami           = "ami-0ca3b0faa0c4c4bbd" # Amazon Linux 5.1
  instance_type = "t2.micro"

  tags = {
    "Name" = "Lambda_Test"
    "Key" = "Value"
  }
}