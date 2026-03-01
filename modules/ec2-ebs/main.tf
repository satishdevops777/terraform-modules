resource "aws_security_group" "this" {
  name        = "${var.name}-sg"
  description = "Security group for EC2"
  vpc_id      = var.vpc_id

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = var.tags
}

resource "aws_instance" "this" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  subnet_id                   = var.subnet_id
  key_name                    = var.key_name
  associate_public_ip_address = var.associate_public_ip_address
  vpc_security_group_ids      = [aws_security_group.this.id]

  root_block_device {
    volume_size           = var.root_volume_size
    volume_type           = var.root_volume_type
    encrypted             = var.root_encrypted
    kms_key_id            = var.kms_key_id
    delete_on_termination = true
  }

  tags = merge(
    var.tags,
    { Name = var.name }
  )
}

resource "aws_ebs_volume" "extra" {
  availability_zone = aws_instance.this.availability_zone
  size              = var.additional_ebs_size
  type              = var.additional_ebs_type
  encrypted         = true
  kms_key_id        = var.kms_key_id

  tags = var.tags
}

resource "aws_volume_attachment" "extra_attach" {
  device_name = var.additional_ebs_device_name
  volume_id   = aws_ebs_volume.extra.id
  instance_id = aws_instance.this.id
}
