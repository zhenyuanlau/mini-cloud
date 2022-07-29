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
    acm            = "http://192.168.205.4:4566"
    apigateway     = "http://192.168.205.4:4566"
    cloudformation = "http://192.168.205.4:4566"
    cloudwatch     = "http://192.168.205.4:4566"
    dynamodb       = "http://192.168.205.4:4566"
    ec2            = "http://192.168.205.4:4566"
    es             = "http://192.168.205.4:4566"
    firehose       = "http://192.168.205.4:4566"
    iam            = "http://192.168.205.4:4566"
    kinesis        = "http://192.168.205.4:4566"
    lambda         = "http://192.168.205.4:4566"
    rds            = "http://192.168.205.4:4566"
    redshift       = "http://192.168.205.4:4566"
    route53        = "http://192.168.205.4:4566"
    s3             = "http://192.168.205.4:4566"
    secretsmanager = "http://192.168.205.4:4566"
    ses            = "http://192.168.205.4:4566"
    sns            = "http://192.168.205.4:4566"
    sqs            = "http://192.168.205.4:4566"
    ssm            = "http://192.168.205.4:4566"
    stepfunctions  = "http://192.168.205.4:4566"
    sts            = "http://192.168.205.4:4566"
  }
}

# resource "aws_s3_bucket" "test-bucket" {
#   bucket = "my-bucket"
# }

resource "aws_instance" "example" {
  ami           = "ami-04681a1dbd79675a5"
  instance_type = "t1.micro"
}
