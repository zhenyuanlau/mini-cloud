resource "multipass_instance" "vm" {

  count = var.instance_count

  name  = "mk8s${count.index}"
  cpus  = var.instance_cpus
  image = var.instance_image

}
