################################

## Spark Master Security Groups

#################################

resource "aws_security_group" "spark_master" {
  name = "spark_master_sg"
  description = "Spark master security group"

  tags {
    Name = "spark_master_${var.environment}"
    Description = "Spark master security group"
  }
}

resource "aws_security_group_rule" "master_incoming_icmp" {
  security_group_id = "${aws_security_group.spark_master.id}"

  type = "ingress"
  from_port = -1
  to_port = -1
  protocol = "icmp"

  cidr_blocks = ["0.0.0.0/0"]
}

# Outbound traffic (egress)
resource "aws_security_group_rule" "master_outbound_all" {
  security_group_id = "${aws_security_group.spark_master.id}"

  type = "egress"
  from_port = 0
  to_port = 0
  protocol = "-1"

  cidr_blocks = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "master_inbound_all" {
  security_group_id = "${aws_security_group.spark_master.id}"

  type = "ingress"
  from_port = 0
  to_port = 65535
  protocol = "tcp"

  cidr_blocks = ["0.0.0.0/0"]
}

################################

## Spark Worker Security Groups

#################################

resource "aws_security_group" "spark_worker" {
  name = "spark_worker_sg"
  description = "Spark worjer security group"

  tags {
    Name = "spark_worker_${var.environment}"
    Description = "Spark worker security group"
  }
}

resource "aws_security_group_rule" "worker_incoming_icmp" {
  security_group_id = "${aws_security_group.spark_worker.id}"

  type = "ingress"
  from_port = -1
  to_port = -1
  protocol = "icmp"

  cidr_blocks = ["0.0.0.0/0"]
}

# Outbound traffic (egress)
resource "aws_security_group_rule" "worker_outbound_all" {
  security_group_id = "${aws_security_group.spark_worker.id}"

  type = "egress"
  from_port = 0
  to_port = 0
  protocol = "-1"

  cidr_blocks = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "worker_inbound_all" {
  security_group_id = "${aws_security_group.spark_worker.id}"

  type = "ingress"
  from_port = 0
  to_port = 65535
  protocol = "tcp"

  cidr_blocks = ["0.0.0.0/0"]
}
