Q := @

.PHONY: multipass terraform open

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
