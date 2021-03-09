//noinspection ConflictingProperties
resource "aws_iam_role" "role" {
  name               = (64 < length(local.name)) ? null : local.name
  name_prefix        = (64 >= length(local.name)) ? null : local.name_prefix
  assume_role_policy = data.aws_iam_policy_document.assume-role.json
}

module "policy" {
  source      = "genstackio/policy/aws"
  version     = "0.1.0"
  name        = local.name
  name_prefix = local.name_prefix
  role_name   = aws_iam_role.role.name
  statements  = [
    {
      effect = "Allow"
      actions = ["codepipeline:StartPipelineExecution"]
      resources = [var.pipeline_arn]
    }
  ]
}

//noinspection ConflictingProperties
resource "aws_cloudwatch_event_rule" "ecr-push" {
  name          = (64 < length(local.name)) ? null : local.name
  name_prefix   = (64 >= length(local.name)) ? null : local.name_prefix
  description   = "Capture ECR Push on ${var.ecr_name}:${var.ecr_tag} and trigger pipeline ${var.pipeline_name}"
  role_arn      = aws_iam_role.role.arn
  event_pattern = <<PATTERN
{
  "detail-type": ["ECR Image Action"],
  "source":      ["aws.ecr"],
  "detail":      {
    "action-type": ["PUSH"],
    "image-tag": ["${var.ecr_tag}"],
    "repository-name": ["${var.ecr_name}"],
    "result": ["SUCCESS"]
  }
}
PATTERN
}

resource "aws_cloudwatch_event_target" "trigger-pipeline" {
  target_id = "trigger-pipeline"
  arn       = var.pipeline_arn
  rule      = aws_cloudwatch_event_rule.ecr-push.name
  role_arn = aws_iam_role.role.arn
}
