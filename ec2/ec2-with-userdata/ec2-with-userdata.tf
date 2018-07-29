# If you don't have aws configured on your machine uncomment the lines that are commented and enter your aws credentials
provider "aws" {
# access_key = "ACCESS_KEY_HERE"
# secret_key = "SECRET_KEY_HERE"
  region     = "us-east-1"
}


variable "key_name" {

}


resource "aws_instance" "example" {
  ami = "ami-cfe4b2b0"
  instance_type = "t2.micro"
  key_name="${var.key_name}"

  user_data = <<-EOF
  #!/bin/bash
  yum install httpd -y
  chmod 775 -R /var/www
  echo "hello from terraform" > /var/www/html/index.html
  service httpd start
  EOF

  security_groups = [
        "${aws_security_group.allow_http.name}"
         ]

  tags {
        Name = "terraform_instance"
       }
}

resource "aws_security_group" "allow_http" {
  name        = "allow_all_http"
  description = "Allow all HTTP traffic"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]

  }

  tags {
    Name = "allow_all_http_ssh"
  }
}

output "ipaddress" {
value= "${aws_instance.example.public_dns}"
}
