# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

provider "aws" {
  region = var.region
}

# Creating a VPC for Neptune to reside
#resource "aws_vpc" "default" {
#  cidr_block = var.vpc
#}

# Establishing a Neptune DB cluster
resource "aws_neptune_cluster" "default" {
  cluster_identifier  = var.cluster_identifier
  engine              = "neptune"
  backup_retention_period = 5
  preferred_backup_window = "07:00-09:00"
  skip_final_snapshot = true
  apply_immediately   = true
  vpc_security_group_ids = ["sg_netptune"]
  neptune_subnet_group_name = "sg-privado"
}

# Generating a Neptune DB instance associated with the cluster
resource "aws_neptune_cluster_instance" "default" {
  identifier  = var.cluster_instance
  cluster_identifier = aws_neptune_cluster.default.id
  instance_class = "db.serverless"
  engine         = "neptune"
  apply_immediately = true
  neptune_parameter_group_name = "default.neptune1.2"
  availability_zone = "us-east-1c"
  kms_key_arn = "arn:aws:kms:us-east-1:874438869694:key/43bdae7d-fbf5-4fd3-a0fb-36e6ca7f0d46"
  publicly_accessible = false
  writer = true
  auto_minor_version_upgrade = true
  tags = {Solution : var.tag}
  tags_all = {Solution : var.tag}
  }