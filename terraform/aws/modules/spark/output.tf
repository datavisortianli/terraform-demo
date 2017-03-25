output "public_ip" {
  value = "${join("\n", aws_instance.spark.*.public_ip)}"
}

output "private_ip" {
  value = "${join("\n", aws_instance.spark.*.private_ip)}"
}

output "instance_id" {
  value = "${join("\n", aws_instance.spark.*.id)}"
}
