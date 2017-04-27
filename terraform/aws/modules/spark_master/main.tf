############################

## Spark Master Node module

############################


## user-data for use in Cloud-Init
data "template_file" "cloud_init_spark_master" {
  template = "${file("${path.module}/../user_data/spark_master.cloud-init.yaml")}"

  vars {
    HOSTNAME = "${var.role}"
    ROLE = "${var.role}"
    REGION_DNS = "${var.dns_region_name}"
    ENV = "${var.environment}"
  }
}

## AWS instances
resource "aws_instance" "spark_master" {
  instance_type = "${var.instance_type}"
  ami = "${var.instance_ami}"
  count = "${var.instance_count}"
  availability_zone = "${element(split(",", var.availability_zones), count.index)}"
  vpc_security_group_ids = ["${split(",", var.vpc_security_groups)}"]
  key_name = "${var.instance_key_name}"
  user_data = "${data.template_file.cloud_init_spark_master.rendered}"
  tags {
    Name = "${var.role}${count.index+1}.${var.dns_region_name}"
    Owner = "${var.owner}"
    Purpose = "Spark Master Node"
    Environment = "${var.environment}"
    role = "${var.role}"
    Warning = "Managed by terraform, do not edit"
  }
  root_block_device {
    volume_type = "gp2"
    volume_size = "8"
    delete_on_termination = "true"
  }

  ebs_block_device {
  device_name = "/dev/xvdd"
  volume_size = "${var.ebs_volume_size}"
  volume_type = "gp2"
  delete_on_termination = "${var.ebs_delete_on_termination}"
  encrypted = "true"
  }
}