################################

## Spark Security Groups output

################################


output "spark_master_sg_id" {
  value = "${aws_security_group.spark_master.id}"
}

output "spark_worker_sg_id" {
  value = "${aws_security_group.spark_worker.id}"
}
