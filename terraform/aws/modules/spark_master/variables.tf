#######################

## Variables for Spark

########################

# String, Full environment name (e.g. 'production/staging/testing')
variable "environment" {}

# Spark role: "master"/ "worker"
variable "role" {}

# Owner who launched the cluster
variable "owner" {}

# e.g. dev.dv.sv
variable "dns_region_name" {}

# Comma sperated string of AZ
# e.g. "us-west-2a,us-west-2b,us-west-2c"
variable "availability_zones" {}

# IP addresss of spark master
variable "master_ip" {
  default = "0.0.0.0"
}

variable "spot_price" {
  default = "4.0"
}

variable "instance_type" {
  default = "t1.micro"
}

# Integer, the number of instances to spawn
variable "instance_count" {
  default = 1
}

variable "instance_key_name" {}

variable "instance_ami" {}

# String, amount of storage per attached EBS volume in gigabytes (GiB)
variable "ebs_volume_size" {}

variable "ebs_delete_on_termination" {
  default = "false"
}

# String, comma separated array of sgs
variable "vpc_security_groups" {}
