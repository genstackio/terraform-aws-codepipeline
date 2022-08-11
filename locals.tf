locals {
  statements = concat(
    [
      {
        actions = [
          "codebuild:BatchGetBuilds",
          "codebuild:StartBuild"
        ]
        resources = ["*"]
        effect    = "Allow"
      }
    ],
    var.policy_statements
  )
}