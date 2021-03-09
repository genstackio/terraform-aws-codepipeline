locals {
  statements = concat(
  [
    {
      actions   = [
        "s3:GetObject",
        "s3:GetObjectVersion",
        "s3:GetBucketVersioning",
        "s3:PutObject"
      ]
      resources = [
        var.pipeline_bucket,
        "${var.pipeline_bucket}/*"
      ]
      effect    = "Allow"
    },
  ],
  var.policy_statements
  )
}