resource "aws_sagemaker_notebook_instance" "aws-neptune-ons-graph" {
  accelerator_types            = []
  additional_code_repositories = []
  default_code_repository      = null
  direct_internet_access       = "Enabled"
  instance_type                = "ml.t3.medium"
  kms_key_id                   = null
  lifecycle_config_name        = "aws-neptune-ons-graph-DEFAULT-LC"
  name                         = "aws-neptune-ons-graph"
  platform_identifier          = "notebook-al2-v1"
  role_arn                     = "arn:aws:iam::874438869694:role/AWSNeptuneNotebookRole-ons-graph"
  root_access                  = "Disabled"
  security_groups              = ["sg-0e44842eea16d6ca5"]
  subnet_id                    = "subnet-08716995e42141384"
  tags = {
    aws-neptune-cluster-id  = "ons-graph"
    aws-neptune-resource-id = aws_neptune_cluster.ons-graph.cluster_resource_id
    
  }
  tags_all = {
    aws-neptune-cluster-id  = "ons-graph"
    aws-neptune-resource-id = aws_neptune_cluster.ons-graph.cluster_resource_id
  }
  volume_size = 10
  instance_metadata_service_configuration {
    minimum_instance_metadata_service_version = "2"
  }
}