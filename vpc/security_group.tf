resource "aws_security_group" "security_groups" {

  name        = "public_sg"
  description = "Allow ssh from Internet to public VM"
  vpc_id      = aws_vpc.vpc.id

  dynamic "ingress_rule" {

    for_each = var.ingress

    content {

      ingress {
        description = ingress_rule.value.description
        from_port   = ingress_rule.value.from_port
        to_port     = ingress_rule.value.to_port
        protocol    = ingress_rule.value.protocol
        cidr_blocks = ingress_rule.value.cidr_blocks

      }

    }

  }


  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "public_sg"
  }
}


