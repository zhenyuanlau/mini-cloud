variable "workers" {
  type = map(any)
  default = {
    "node1" = "mk8s1",
    "node2" = "mk8s2",
    "node3" = "mk8s3"
  }
}
