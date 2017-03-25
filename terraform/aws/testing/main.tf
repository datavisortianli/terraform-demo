######################

## Spark Demo

######################

provider "aws" {
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
  region = "${var.region}"
}

module "spark_security_groups" {
  source = "../modules/security_groups"

  environment = "${var.environment}"
}


module "spark-master" {
  source = "../modules/spark"

  role = "spark-master"
  owner = "${var.owner}"
  environment = "${var.environment}"
  dns_region_name = "${var.dns_region_name}"
  instance_count = 1
  instance_type = "${var.instance_type}"
  instance_ami = "${var.instance_ami}"
  instance_key_name = "${var.instance_key_name}"
  availability_zones = "${var.availability_zones}"
  vpc_security_groups = "${module.spark_security_groups.spark_master_sg_id}"

  ebs_volume_size = "${var.ebs_volume_size}"
  ebs_delete_on_termination = true
}

module "spark-worker" {
  source = "../modules/spark"

  role = "spark-worker"
  owner = "${var.owner}"
  environment = "${var.environment}"
  dns_region_name = "${var.dns_region_name}"
  instance_count = "${var.workers_count}"
  instance_type = "${var.instance_type}"
  instance_ami = "${var.instance_ami}"
  instance_key_name = "${var.instance_key_name}"
  availability_zones = "${var.availability_zones}"
  vpc_security_groups = "${module.spark_security_groups.spark_worker_sg_id}"

  master_ip = "${module.spark-master.private_ip}"

  ebs_volume_size = "${var.ebs_volume_size}"
  ebs_delete_on_termination = true
}
