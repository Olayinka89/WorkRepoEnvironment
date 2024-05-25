variable "server_name" {
    description = "The name of the instance to be created"
    type = string
    default = "web_server1"
}

variable "region" {
  description = "The AWS region to deploy in"
  type = string
  default     = "us-east-1"
}

variable "instance_type" {
  description = "The type of instance to use"
  type = string
  default     = "t2.micro"
}

variable "ami_id" {
  description = "The AMI ID to use for the instance"
  type = string
  default     = "ami-0c55b159cbfafe1f0" 
}

variable "public_ip" {
  description = "Associate a public IP address with the instance"
  default     = true
}

variable "http_port" {
  description = "The port to allow for HTTP traffic"
  type = list(any)
  default     = [80]
}

variable "vpc_security_group_ids" {
  description = "The security group vpc "
  default     = true


}