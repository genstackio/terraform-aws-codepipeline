locals {
  prefix      = "${var.pipeline_name}-${var.ecr_name}-${var.ecr_tag}-trigger-ecr"
  name        = "pipeline-${local.prefix}"
  name_prefix = "pipeline-trigger-ecr-"
}