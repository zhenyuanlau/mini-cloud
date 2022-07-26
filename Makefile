Q := @

.PHONY: multipass terraform open clean

multipass:
	$(Q) multipass launch docker
	$(Q) multipass start docker
	$(Q) multipass alias docker:docker

terraform:
	$(Q) terraform fmt
	$(Q) terraform validate
	$(Q) terraform init
	$(Q) terraform plan
	$(Q) terraform apply

open:
	$(Q) open http://$$(multipass exec docker -- hostname -I | awk '{print $$1}'):8080
clean:
	$(Q) rm -fr terraform.tfstate
