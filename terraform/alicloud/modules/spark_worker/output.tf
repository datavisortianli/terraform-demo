output "public_ip" {
  value = "${join("\n", alicloud_instance.spark_worker.*.public_ip)}"
}

output "private_ip" {
  value = "${join("\n", alicloud_instance.spark_worker.*.private_ip)}"
}

output "instance_id" {
  value = "${join("\n", alicloud_instance.spark_worker.*.id)}"
}
