export AWS_ACCESS_KEY_ID :=
export AWS_SECRET_ACCESS_KEY :=
ANSIBLE_SSH_PRIVATE_KEY :=

KEYS := -var access_key=$(AWS_ACCESS_KEY_ID) -var secret_key=$(AWS_SECRET_ACCESS_KEY)

CURRENT_DIR := $(shell pwd)

.PHONY: links

links:
	ln -nsf $(CURRENT_DIR)/terraform.tfvars $(CURRENT_DIR)/terraform/aws/testing/terraform.tfvars
	ln -nsf $(CURRENT_DIR)/variables.json $(CURRENT_DIR)/packer/variables.json

create: links launch provision

build: links
	cd packer && packer build -var-file="variables.json" spark_base.json && sleep 20

destroy: links
	cd terraform/aws/testing && terraform get && terraform destroy $(KEYS) -var-file="terraform.tfvars"

plan: links
	cd terraform/aws/testing && terraform get && terraform plan $(KEYS) -var-file="terraform.tfvars"

launch: links
	cd terraform/aws/testing $$ terraform get && terraform apply $(KEYS) -var-file="terraform.tfvars" && sleep 20

provision:
	cd ansible && ansible-playbook -s spark.yml -u ubuntu -i inventories/ec2.py --private-key $(ANSIBLE_SSH_PRIVATE_KEY)

output:
	cd terraform/aws/testing && terraform output