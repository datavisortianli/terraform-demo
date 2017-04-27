output "public_ip" {
  value = "${join("\n", aws_instance.spark_master.*.public_ip)}"
}

output "private_ip" {
  value = "${join("\n", aws_instance.spark_master.*.private_ip)}"
}

output "instance_id" {
  value = "${join("\n", aws_instance.spark_master.*.id)}"
}
