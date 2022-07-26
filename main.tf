provider "multipass" {}

module "mk8s_cluster" {

  source = "./modules/multipass-instance"

  instance_count = 3

}
