variable "ami_id" {
  # default = "ami-04681a1dbd79675a5"
  default = "ami-0fb653ca2d3203ac1"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "localstack_edge_host" {
  # default = "192.168.205.4"
  default = "127.0.0.1"
}

variable "localstack_edge_port" {
  default = 4566
}
