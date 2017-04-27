variable "access_key" {}
variable "secret_key" {}

variable "region" {}

# e.g. testing/staging/production/trial
variable "environment" {}

# Owner who launched the cluster
variable "owner" {}

variable "spark_master_ami" {}

variable "spark_worker_ami" {}

# The name of your ssh key pair in aws
variable "instance_key_name" {}

variable "ebs_volume_size" {
    default = 10
}

variable "dns_region_name" {
  default = "dev.dv.sv"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "availability_zones" {
  default = "us-west-2a,us-west-2b,us-west-2c"
}

# How many workers in this Spark cluster
variable "workers_count" {}



