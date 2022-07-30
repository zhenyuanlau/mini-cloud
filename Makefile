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
	$(Q) docker run --name localstack_main -d -p 0.0.0.0:4566:4566 -p 4510-4559:4510-4559 -e DEBUG=1 localstack/localstack

openstack:
	$(Q) open http://$$(multipass exec docker -- hostname -I | awk '{print $$1}'):4566/health

deps:
	$(VENV)/pip freeze > requirements.txt

ec2_instances:
	$(Q) $(VENV)/awslocal ec2 describe-instances --region=cn-north-1 --filter="Name=tag:Name,Values=terraform-example"
ec2_instance_ip:
	$(Q) $(VENV)/awslocal --region=cn-north-1 ec2 describe-instances --filters "Name=instance-state-name,Values=running" "Name=instance-id,Values=i-33cf6506371140778" --query 'Reservations[*].Instances[*].[PrivateIpAddress,PublicIpAddress]'

clean:
	$(Q) rm -fr terraform.tfstate

include Makefile.venv
