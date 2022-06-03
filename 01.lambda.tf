resource "aws_lambda_function" "test_lambda" {
  # If the file is not in the current working directory you will need to include a 
  # path.module in the filename.
  #filename      = "lambda.zip"
  function_name = "lambda_function_name"
  role          = aws_iam_role.iam_for_lambda.name
  handler       = "index.test"
  filename = "./lambda.py"

  # The filebase64sha256() function is available in Terraform 0.11.12 and later
  # For Terraform 0.11.11 and earlier, use the base64sha256() function and the file() function:
  # source_code_hash = "${base64sha256(file("lambda_function_payload.zip"))}"
 # source_code_hash = filebase64("lambda_function_payload.zip")

   runtime = "python3.8"

  /* environment {
    variables = {
      foo = "bar"
    }
  } */
}