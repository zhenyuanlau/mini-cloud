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
    acm            = "http://${var.localstack_edge_host}:${var.localstack_edge_port}"
    apigateway     = "http://${var.localstack_edge_host}:${var.localstack_edge_port}"
    cloudformation = "http://${var.localstack_edge_host}:${var.localstack_edge_port}"
    cloudwatch     = "http://${var.localstack_edge_host}:${var.localstack_edge_port}"
    dynamodb       = "http://${var.localstack_edge_host}:${var.localstack_edge_port}"
    ec2            = "http://${var.localstack_edge_host}:${var.localstack_edge_port}"
    es             = "http://${var.localstack_edge_host}:${var.localstack_edge_port}"
    firehose       = "http://${var.localstack_edge_host}:${var.localstack_edge_port}"
    iam            = "http://${var.localstack_edge_host}:${var.localstack_edge_port}"
    kinesis        = "http://${var.localstack_edge_host}:${var.localstack_edge_port}"
    lambda         = "http://${var.localstack_edge_host}:${var.localstack_edge_port}"
    rds            = "http://${var.localstack_edge_host}:${var.localstack_edge_port}"
    redshift       = "http://${var.localstack_edge_host}:${var.localstack_edge_port}"
    route53        = "http://${var.localstack_edge_host}:${var.localstack_edge_port}"
    s3             = "http://${var.localstack_edge_host}:${var.localstack_edge_port}"
    secretsmanager = "http://${var.localstack_edge_host}:${var.localstack_edge_port}"
    ses            = "http://${var.localstack_edge_host}:${var.localstack_edge_port}"
    sns            = "http://${var.localstack_edge_host}:${var.localstack_edge_port}"
    sqs            = "http://${var.localstack_edge_host}:${var.localstack_edge_port}"
    ssm            = "http://${var.localstack_edge_host}:${var.localstack_edge_port}"
    stepfunctions  = "http://${var.localstack_edge_host}:${var.localstack_edge_port}"
    sts            = "http://${var.localstack_edge_host}:${var.localstack_edge_port}"
  }
}

resource "aws_security_group" "instance" {
  name = "terraform-example-instance"

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


resource "aws_instance" "example" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.instance.id]

  user_data = <<-EOF
              #!/bin/bash
              echo "Hello, World" > index.html
              nohup busybox httpd -f -p 8080 &
              EOF

  tags = {
    Name = "terraform-example"
  }

}
