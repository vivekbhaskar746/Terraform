terraform {
  backend "s3" {
    bucket         = "my-terraform-chat-bot-infra-bucket"
    key            = "prod/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}


