resource "aws_iam_role_policy" "policy" {
  role   = var.role_name
  policy = data.aws_iam_policy_document.policy.json
}
