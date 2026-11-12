terraform{
   required_providers{
    aws = {
      source = "hashicorp/aws"
      version = "~>4.16"
    }
   }
 
   required_version = ">= 1.2.0"

}

provider "aws"{
 region = "ap-southeast-2"

}

data "aws_ssm_parameter" "amazon_linux"{
  name = "/aws/service/ami-amazon-linux-latest/al2023-ami-kernel-default-x86_64"
}

resource "aws_instance" "app_server"{
 ami = data.aws_ssm_parameter.amazon_linux.value
 instance_type = "t3.micro"
 availability_zone = "ap-southeast-2c"


 tags = {
   Name = "Terraform Demo"
 }
}
