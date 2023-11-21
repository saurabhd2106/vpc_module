module "test_vpc" {

  source = "../vpc"

  cidr_block = "10.0.0.0/16"

  subnets = {
    "public_subnet" = {
      "cidr_block" = "10.0.1.0/24"
    },

    "private_subnet" = {
      "cidr_block" = "10.0.2.0/24"
    }
  }

  vpc_name       = "vpc-saurabh"
  ami_image_name = "ami-0e83be366243f524a"
  instance_type  = "t2.micro"

  ingress = {
    "allow_ssh" = {
      description = "Allow ssh"
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    },

    "allow_http" = {

      description = "Allow http"
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]

    }
  }

}
