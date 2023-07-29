variable "ssm_document_name" {
  description = "The name of the SSM document"
  type        = string
  default     = "run-my-script"
}

variable "script_to_run" {
  description = "The script to run on the EC2 instance"
  type        = string
}

variable "ec2_instance_id" {
  description = "The ID of the EC2 instance to run the script on"
  type        = string
}
