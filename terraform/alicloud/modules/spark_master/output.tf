output "public_ip" {
  value = "${join("\n", alicloud_instance.spark_master.*.public_ip)}"
}

output "private_ip" {
  value = "${join("\n", alicloud_instance.spark_master.*.private_ip)}"
}

output "instance_id" {
  value = "${join("\n", alicloud_instance.spark_master.*.id)}"
}
