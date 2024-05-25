module "web" {
    source = "../../..//modules/project_ec2"

    server_name = "web_server1"
    region      = "us-east-1"
    instance_type = "t2.micro"
    ami_id = "ami-04b70fa74e45c3917"
}