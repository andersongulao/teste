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
  #engine_version      = "1.2.0.2"
  backup_retention_period = 5
  preferred_backup_window = "07:00-09:00"
  skip_final_snapshot = true
  apply_immediately   = true
  #vpc_security_group_ids = ["sg_netptune"]
  neptune_subnet_group_name = "sg-privado"
  neptune_cluster_parameter_group_name = "default.neptune1.2"
  iam_roles = ["AWSGlueServiceRoleDefault"]
  
  serverless_v2_scaling_configuration {
    min_capacity : 1,
    max_capacity : 4
  }
}

# Generating a Neptune DB instance associated with the cluster
resource "aws_neptune_cluster_instance" "default" {
  identifier  = var.cluster_instance
  cluster_identifier = aws_neptune_cluster.default.id
  instance_class = "db.serverless"
  neptune_parameter_group_name = "default.neptune1.2"
  engine         = "neptune"
  apply_immediately = true
  availability_zone = "us-east-1c"
  publicly_accessible = false
  auto_minor_version_upgrade = true
  tags = {Solution : var.tag}
  tags_all = {Solution : var.tag}
  }