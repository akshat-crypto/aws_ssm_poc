resource "aws_ssm_document" "ssmdocument" {
  name = var.ssm_document_name
  document_type = "Command"
  content = jsonencode({
    schemaVersion = "2.2"
    description   = "Run my custom script on EC2 instance"
    mainSteps = [
      {
        action = "aws:runShellScript"
        name   = "runShellScript"
        inputs = {
          runCommand = [var.script_to_run]
        }
      }
    ]
  })
  target_type = "/AWS::EC2::Instance"
}

resource "aws_ssm_association" "ssmassociate" {
#   name          = "run-my-script-on-instance"
  name = aws_ssm_document.ssmdocument.name
  targets {
    key    = "tag:Env"
    values = ["SSMProd"]
  }
}
