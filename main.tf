# Configure AWS Provider
provider "aws" {
  region = "us-east-1"
}

# -------------------------------
# EC2 Instance
# -------------------------------
resource "aws_instance" "example_ec2" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"
  subnet_id     = "subnet-12345678"   # Replace with your subnet
  key_name      = "my-keypair"        # Replace with your AWS key pair

  vpc_security_group_ids = [aws_security_group.ec2_sg.id]

  tags = {
    Name = "Terraform-EC2"
  }
}


# -------------------------------
# S3 Bucket
# -------------------------------
resource "aws_s3_bucket" "example_bucket" {
  bucket = "terraform-example-bucket-12345"
  acl    = "private"

  tags = {
    Name = "Terraform-S3"
  }
}

# -------------------------------
# ECR Repository
# -------------------------------
resource "aws_ecr_repository" "example_ecr" {
  name = "terraform-example-repo"
}

# -------------------------------
# ECS Cluster
# -------------------------------
resource "aws_ecs_cluster" "example_ecs" {
  name = "terraform-example-cluster"
}

# -------------------------------
# EKS Cluster (simplified)
# -------------------------------
resource "aws_eks_cluster" "example_eks" {
  name     = "terraform-example-eks"
  role_arn = "arn:aws:iam::123456789012:role/EKSClusterRole"   # Replace with valid IAM role

  vpc_config {
    subnet_ids = ["subnet-12345678", "subnet-87654321"]        # Replace with your subnets
  }
}