output "public_ip" {
  value = "${join("\n", aws_spot_instance_request.spark_worker_spot.*.public_ip)}"
}

output "private_ip" {
  value = "${join("\n", aws_spot_instance_request.spark_worker_spot.*.private_ip)}"
}

output "instance_id" {
  value = "${join("\n", aws_spot_instance_request.spark_worker_spot.*.id)}"
}
