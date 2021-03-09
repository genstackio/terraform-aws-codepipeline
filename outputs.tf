output "id" {
  value = aws_codepipeline.pipeline.id
}
output "name" {
  value = aws_codepipeline.pipeline.name
}
output "role_arn" {
  value = aws_codepipeline.pipeline.role_arn
}
output "arn" {
  value = aws_codepipeline.pipeline.arn
}
output "artifacts_bucket_arn" {
  value = aws_s3_bucket.artifacts.arn
}
output "artifacts_bucket" {
  value = aws_s3_bucket.artifacts.id
}