resource "aws_lambda_function" "test_lambda" {
  # If the file is not in the current working directory you will need to include a 
  # path.module in the filename.
  filename      = data.archive_file.lambda.output_path # 압축 한 data file
  function_name = "EC2-Scheduler"
  role          = aws_iam_role.iam_for_lambda.arn
  handler       = "lambda.lambda_handler" # Python Handler Name ex) Python_File_Name.Method_Name
  # memory_size = 10240
  timeout = 30

  source_code_hash = data.archive_file.lambda.output_base64sha256

  runtime = "python3.8"

  /* environment {
    variables = {
      foo = "bar"
    }
  } */
}