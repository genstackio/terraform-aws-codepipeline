# AWS CodePipeline Trigger ECR Terraform module

Terraform module which creates codepipeline trigger ECR on AWS.

## Usage

```hcl
module "codepipeline-trigger-ecr" {
  source     = "genstackio/codepipeline/aws//modules/trigger-ecr"

  // ...
}
```
