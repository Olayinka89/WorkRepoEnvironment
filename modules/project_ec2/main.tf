resource "aws_instance" "web_server1" {
  ami           = var.ami_id
  instance_type = var.instance_type

  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              yum install -y nginx
              systemctl start nginx
              systemctl enable nginx
              echo "<html><body><h1>Hello, World from Terraform!</h1></body></html>" > /usr/share/nginx/html/index.html
              EOF

  #vpc_security_group_ids       = [aws_security_group.web_server1_sg.id]
  #associate_public_ip_address  = var.public_ip
}

#resource "aws_security_group" "web_server1_sg" {
  #name        = "web_server1_sg"
  #description = "Allow HTTP traffic"

  #ingress {
    #from_port   = 80
    #to_port     = 80
    #protocol    = "tcp"
    #cidr_blocks = ["0.0.0.0/0"]
 # }

  #egress {
    #from_port   = 0
    #to_port     = 0
    #protocol    = "-1"
    #cidr_blocks = ["0.0.0.0/0"]
  #}
#}