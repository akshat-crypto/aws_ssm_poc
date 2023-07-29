data "aws_ami" "ubuntu" {
    most_recent=true
    filter {
        name   = "name"
        values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-20230517"]
    }

    filter {
        name   = "virtualization-type"
        values = ["hvm"]
    }

    owners = ["099720109477"] # Canonical
}

resource "aws_instance" "testing_instance" {
  ami           = data.aws_ami.ubuntu.id
  count         = 2
  instance_type = var.instance_type
  key_name      = var.key_name
  iam_instance_profile = var.rolename
  tags = var.tags
}
