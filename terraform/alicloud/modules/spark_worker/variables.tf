##############################

## Variables for Spark Master

#############################

## Basic Info

# String, Full environment name (e.g. 'production/staging/testing')
variable "environment" {}

# spark role: "master"/ "worker"
variable "role" {}

# Owner who launched the cluster
variable "owner" {}

# e.g. dev.dv.sv
variable "dns_region_name" {}

# Comma sperated string of AZ
# https://intl.aliyun.com/help/faq-detail/40654.htm
# e.g. "cn-hangzhou-a,cn-hangzhou-b"
variable "availability_zones" {}

# Spark master ip
Variable "spark_master_ip" {}


## Compute Info

variable "instance_type" {
  default = "ecs.n1.medium"
}

variable "image_id" {}

variable "instance_count" {
  default = 1
}

# Valid values: "none"/ "optimized"
variable "io_optimized" {
  default = "none"
}

# Valid values: "cloud", "cloud_efficiency", "cloud_ssd"
# If I/O optimized, "cloud_ssd" and "cloud_efficiency" disks are supported.
variable "system_disk_category" {
  default = "cloud"
}

# Value range: 40 - 500 GB
variable "system_disk_size" {
  default = 40
}

# Valid values: "cloud", "cloud_efficiency", "cloud_ssd"
variable "xvdb_disk_category" {
  default = "cloud"
}

# Valid values
# "cloud": 5 - 2000 GB
# "cloud_efficiency"/ "cloud_ssd":  20 - 32768 GB
variable "xvdb_disk_size" {
  default = "50"
}


## Networking Info

# String, comma separated array of security groups' ids
variable "security_group_ids" {}

# Valid values: "PayByBandwidth"/ "PayByTraffic"
variable "internet_charge_type" {
  default = "PayByBandwidth"
}

# Valid values: 1 - 200 Mbps
variable "internet_max_bandwidth_id" {
  default = "200"
}

# Valid values: 0 - 100 Mbps
# If 'internet_charge_type' is 'PayByTraffic', valid value would be 1 - 100 Mbps
variable "internet_max_bandwidth_out" {
  default = 200
}
