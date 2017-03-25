output "environment" {
  value = "${var.environment}"
}

output "spark-master_public_ip" {
    value = "${module.spark-master.public_ip}"
}

output "spark-worker_public_ip" {
    value = "${module.spark-worker.public_ip}"
}
