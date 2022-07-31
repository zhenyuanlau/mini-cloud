terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.18.0"
    }
  }
}

provider "aws" {
  region                      = "cn-north-1"
  access_key                  = "test"
  secret_key                  = "test"
  skip_credentials_validation = true
  skip_metadata_api_check     = true
  skip_requesting_account_id  = true

  endpoints {
    acm            = "http://${var.localstack_host}:${var.localstack_port}"
    apigateway     = "http://${var.localstack_host}:${var.localstack_port}"
    cloudformation = "http://${var.localstack_host}:${var.localstack_port}"
    cloudwatch     = "http://${var.localstack_host}:${var.localstack_port}"
    dynamodb       = "http://${var.localstack_host}:${var.localstack_port}"
    ec2            = "http://${var.localstack_host}:${var.localstack_port}"
    es             = "http://${var.localstack_host}:${var.localstack_port}"
    firehose       = "http://${var.localstack_host}:${var.localstack_port}"
    iam            = "http://${var.localstack_host}:${var.localstack_port}"
    kinesis        = "http://${var.localstack_host}:${var.localstack_port}"
    lambda         = "http://${var.localstack_host}:${var.localstack_port}"
    rds            = "http://${var.localstack_host}:${var.localstack_port}"
    redshift       = "http://${var.localstack_host}:${var.localstack_port}"
    route53        = "http://${var.localstack_host}:${var.localstack_port}"
    s3             = "http://s3.localhost.localstack.cloud:4566"
    secretsmanager = "http://${var.localstack_host}:${var.localstack_port}"
    ses            = "http://${var.localstack_host}:${var.localstack_port}"
    sns            = "http://${var.localstack_host}:${var.localstack_port}"
    sqs            = "http://${var.localstack_host}:${var.localstack_port}"
    ssm            = "http://${var.localstack_host}:${var.localstack_port}"
    stepfunctions  = "http://${var.localstack_host}:${var.localstack_port}"
    sts            = "http://${var.localstack_host}:${var.localstack_port}"
  }
}

resource "aws_s3_bucket" "test-bucket" {
  bucket = "my-bucket"
}

resource "aws_security_group" "instance" {
  name = "terraform-example-instance"

  ingress {
    from_port       = 8080
    to_port         = 8080
    protocol        = "tcp"
    cidr_blocks     = ["0.0.0.0/0"]
    security_groups = ["sg-adc9192fcd5eca0e2"]
  }
}


resource "aws_instance" "example" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.instance.id]

  user_data = <<-EOF
              #!/bin/bash
              echo "Hello, World" > index.html
              nohup busybox httpd -f -p 0.0.0.0:8080 &
              EOF
  tags = {
    Name = "terraform-example"
  }

}
