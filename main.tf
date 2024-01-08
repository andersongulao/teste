# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

provider "aws" {
  region = var.region
}

# Creating a VPC for Neptune to reside
resource "aws_vpc" "default" {
  cidr_block = var.vpc
}

# Establishing a Neptune DB cluster
resource "aws_neptune_cluster" "default" {
  cluster_identifier  = var.cluster_identifier
  engine              = "neptune"
  backup_retention_period = 5
  preferred_backup_window = "07:00-09:00"
  skip_final_snapshot = true
  apply_immediately   = true
}

# Generating a Neptune DB instance associated with the cluster
resource "aws_neptune_cluster_instance" "default" {
  identifier  = var.cluster_instance
  cluster_identifier = aws_neptune_cluster.example.id
  instance_class = "db.serverless"
  engine         = "neptune"
  apply_immediately = true
}