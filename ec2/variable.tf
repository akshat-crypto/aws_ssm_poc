variable "ami_id" {
  description = "The ID of the AMI to use for the EC2 instance"
  type        = string
#   default     = 
}

variable "instance_type" {
  description = "The type of EC2 instance to launch"
  type        = string
#   default     = "t2.medium"
}

variable "key_name" {
  description = "The name of the key pair to associate with the EC2 instance"
  type        = string
#   default     = "ssm_test"
}

variable "tags" {
  description = "Tags to apply to the EC2 instance"
  type        = map(string)
  default     = {
    Name = "SSMtesting"
    Env  = "SSMProd"
  }
}

variable "rolename" {}
