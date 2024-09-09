output "bucket_id" {
    value = aws_s3_bucket.backend.id
    description = "Prints bucket id"
}
output "bucket_arn" {
  value = aws_s3_bucket.backend.arn
  description = "prints bucket arn"
}