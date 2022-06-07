data "archive_file" "lambda" {
  type = "zip"

  source_dir  = "${path.module}/lambda" # 압축 할 local directory name
  output_path = "${path.module}/lambda/lambda.zip"
} 
resource "aws_s3_bucket" "lambda_s3" {
  bucket = "hemmu-lambda-s3"

  tags = {
    Name        = "My bucket"
    Environment = "lambda"
  }
} # lambda s3

resource "aws_s3_bucket_acl" "example" {
  bucket = aws_s3_bucket.lambda_s3.id
  acl    = "private"
}

resource "aws_s3_object" "lambda" {
  bucket = aws_s3_bucket.lambda_s3.id

  key    = "lambda.zip"
  source = data.archive_file.lambda.output_path
}