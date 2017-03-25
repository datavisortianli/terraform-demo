# Terraform Demo
This repository is only for [DataVisor](www.datavisor.com) internal demo, not production ready.

## Requirement

* Linux distro: Ubuntu 16.04 (with systemd)

* [packer](https://www.packer.io/): for creating base spark AMI.

    ```bash
    $ brew install packer
    ```


* [terraform](https://www.terraform.io/): for Infrastructure Orchestration. (or Infrastructure as Code)

    ```bash
    $ brew install terraform
    ```

* [ansbile](https://www.ansible.com/): Infrastructure provision. (or Configuration Management)

    ```bash
    $ brew install ansible
    $ pip install ansible
    ```

* [AWS Access Key and Secret Key](https://aws.amazon.com/developers/access-keys/)
* [AWS EC2 Key Pairs](http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-key-pairs.html#having-ec2-create-your-key-pair)

## Deployment Steps

### Packer
Put your AWS Access Key and Secret Key into `variables.json`

```bash
$ cat variables.json
{
  "aws_access_key": "AXXXXXXXXXXXXXXXXXX",
  "aws_secret_key": "XXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
}
```

Run the command to build your spark base image

```bash
$ make build
```

Once the Packer build has completed, you could see the AMI ID. It looks like:

```
==> Builds finished. The artifacts of successful builds are:
--> amazon-ebs: AMIs were created:

us-west-2: ami-6XXXXXXX
```

### Terrafrom && Ansible
Put your AWS Access Key, Secret Key and pem(private key) of your Key Pair into the Makefile of the top directory:

```
$ cat Makefile
...

export AWS_ACCESS_KEY_ID := AXXXXXXXXXXXXXXXXXXXXX
export AWS_SECRET_ACCESS_KEY := XXXXXXXXXXXXXXXXXXXXXXXXXXXX

ANSIBLE_SSH_PRIVATE_KEY := /path/to/your/XXX.pem
...
```

Modify variables in `terraform.tfvars`:

```
$ cat terraform/aws/testing/terraform.tfvars

environment = "testing"
region = "us-west-2"
workers_count = 10
instance_ami = "ami-6XXXXXXX"
instance_key_name = "XXXXXXXXX"
...
```
or you can add other variables, refer variables in `terraform/aws/testing/variables.tf`.

Run `make`:

* `make plan`: dry run for terraform.
* `make launch`: launch spark instances by using terraform.
* `make provison`: provisoning your spark cluster by using ansible, after all instances are launched.
* `make create`: launch + provison
* `make destroy`: destroy (terminate) your spark cluster (**Be Careful**)