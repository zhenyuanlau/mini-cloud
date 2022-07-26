output "echo" {
  description = "module name"
  value       = "multipass-instance"
}

output "nodes" {
  description = "count of nodes"
  value       = multipass_instance.vm.*.image
}

