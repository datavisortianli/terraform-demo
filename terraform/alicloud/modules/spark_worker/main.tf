###########################

## Spark Worker Node Module

###########################


## user-data for use in Cloud-Init
data "template_file" "cloud_init_spark_worker" {
  template = "${file("${path.module}/../user_data/spark_worker.cloud-init.yaml")}"

  vars {
    ROLE = "${var.role}"
    REGION_DNS = "${var.dns_region_name}"
    ENV = "${var.environment}"
  }
}


## Alicloud ECS Instance
resource "alicloud_instance" "spark_worker" {
  instance_type = "${var.instance_type}"
  image_id = "${var.image_id}"
  count = "${var.instance_count}"
  availability_zone = "${element(split(",", var.availability_zones), count.index)}"
  instance_name = "${var.role}${count.index+1}.${var.dns_region_name}"
  host_name = "${var.role}${count.index+1}.${var.dns_region_name}"
  allocate_public_ip = "true"

  # system disk (root)
  io_optimized = "${var.io_optimized}"
  system_disk_category = "${var.system_disk_category}"
  system_disk_size = "${var.system_disk_size}"

  # networking
  security_group_ids = ["${split(",", var.security_groups)}"]
  internet_charge_type = "${var.internet_charge_type}"
  internet_max_bandwidth_in = "${var.internet_max_bandwidth_in}"
  internet_max_bandwidth_out = "${var.internet_max_bandwidth_out}"
  # vswitch_id = "${var.vswitch_id}"

  instance_charge_type = "PostPaid"

  tags {
    Name = "${var.role}${count.index+1}.${var.dns_region_name}"
    Owner = "${var.owner}"
    Environment = "${var.environment}"
    Role = "${var.role}"
    Warning = "Managed by terraform, do not edit"
  }

  user_data = "${data.template_file.cloud_init_spark_worker.rendered}"

}


## Attached disks

resource "alicloud_disk" "spark_worker_xvdb" {
  count = "${var.instance_count}"
  availability_zone = "${element(split(",", var.availability_zones), count.index)}"
  size = "${var.xvdb_disk_size}"
  category = "${var.xvdb_disk_category}"

  tags {
    Name = "/dev/xvdb_${var.role}${count.index+1}.${var.dns_region_name}"
  }
}

resource "alicloud_disk_attachment" "spark_worker_xvdb_attach" {
  count = "${var.instance_count}"
  disk_id = "${element(alicloud_disk.spark_worker_xvdb.*.id, count.index)}"
  instance_id = "${element(alicloud_instance.spark_worker.*.id, count.index)}"
  device_name = "/dev/xvdb"
}
