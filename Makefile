Q := @

.PHONY: multipass terraform open clean

# multipass:
# 	$(Q) multipass launch docker
# 	$(Q) multipass start docker
# 	$(Q) multipass alias docker:docker

# terraform:
# 	$(Q) terraform fmt
# 	$(Q) terraform validate
# 	$(Q) terraform init
# 	$(Q) terraform plan
# 	$(Q) terraform apply

# open:
# 	$(Q) open http://$$(multipass exec docker -- hostname -I | awk '{print $$1}'):8080

localstack:
	$(Q) docker run --rm -it -p 0.0.0.0:4566:4566 -p 4510-4559:4510-4559 -e DEBUG=1 localstack/localstack

openstack:
	$(Q) open http://$$(multipass exec docker -- hostname -I | awk '{print $$1}'):4566/health

deps:
	$(VENV)/python -m pip freeze > requirements.txt

clean:
	$(Q) rm -fr terraform.tfstate

include Makefile.venv
