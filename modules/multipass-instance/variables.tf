variable "instance_count" {
  description = "Number of vm instance"
  type        = number
  default     = 3
}

variable "instance_cpus" {
  description = "Number of CPUs to allocate"
  type        = number
  default     = 4
}

variable "instance_image" {
  description = "Image to launch"
  type        = string
  default     = "jammy"
}
