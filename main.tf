module "roles" {
  source = "./roles"
  # You can customize the role_name if needed
}

module "ec2" {
  source        = "./ec2"
  ami_id        = "ami-0c55b159cbfafe1f0"  # Replace with your desired AMI ID
  instance_type = "t2.micro"               # Replace with your desired instance type
  key_name      = "ssmtesting"     # Replace with the name of your key pair
  rolename      = module.roles.rolename
  tags = {
    Name = "SSMtesting",
    Env  = "SSMProd"
  }
}

module "ssm" {
  source              = "./ssm"
  ssm_document_name   = "run-my-script"
  script_to_run       = "apt update && apt install apache2 -y"  # Replace with your desired script
  ec2_instance_id     = module.ec2.instanceid
}
