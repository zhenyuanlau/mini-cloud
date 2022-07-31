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

# openstack:
# 	$(Q) open http://$$(multipass exec docker -- hostname -I | awk '{print $$1}'):4566/health

# localstack:
# 	$(Q) docker run --name localstack_main -d -p 0.0.0.0:4566:4566 -p 4510-4559:4510-4559 -p 5678:5678 -p 8080:8080 -e DEBUG=1 -v /var/run/docker.sock:/var/run/docker.sock localstack/localstack

# delstack:
# 	$(Q) docker container stop localstack_main; docker container rm localstack_main

# ec2_instances:
# 	$(Q) $(VENV)/awslocal --region=cn-north-1 ec2 describe-instances --filters "Name=instance-state-name,Values=running" --query 'Reservations[*].Instances[*].[InstanceId, InstanceType, PrivateIpAddress,PublicIpAddress, Tags[?Key==`Name`]|[0].Value]' --output table

# ec2_sgroup:
# 	$(Q) $(VENV)/awslocal ec2 describe-security-groups --region cn-north-1

# openstack:
# 	$(Q) open http://127.0.0.1:4566/health

deps:
	$(VENV)/pip freeze > requirements.txt

clean:
	$(Q) rm -fr terraform.tfstate

include Makefile.venv
