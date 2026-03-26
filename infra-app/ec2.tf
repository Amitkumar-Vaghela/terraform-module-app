# -----------------------------
# Key Pair
# -----------------------------
resource "aws_key_pair" "my_key" {
  key_name   = "${var.env}-infra-app-key"
  public_key = file(var.public_key_path)

  tags = {
    Environment = var.env
  }
}

# -----------------------------
# Default VPC
# -----------------------------
resource "aws_default_vpc" "my_vpc" {}

# -----------------------------
# Security Group
# -----------------------------
resource "aws_security_group" "my_security_group" {
  name        = "${var.env}-infra-sg"
  description = "Allow SSH and HTTP"
  vpc_id      = aws_default_vpc.my_vpc.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # restrict later
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.env}-infra-app-sg"
  }
}

# -----------------------------
# EC2 Instance
# -----------------------------
resource "aws_instance" "my_instance" {

  depends_on = [aws_security_group.my_security_group]

  count = var.instance_count

  ami           = var.ec2_ami_id
  instance_type = var.instance_type

  # attach key here
  key_name = aws_key_pair.my_key.key_name

  root_block_device {
    volume_size = var.env == "prd" ? 20 : 10
    volume_type = "gp3"
  }

  tags = {
    Name        = "${var.env}-infra-app-instance"
    environment = var.env
  }
}