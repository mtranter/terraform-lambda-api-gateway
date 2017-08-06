output "aws_lambda_function_arn" {
  value = "${aws_lambda_function.lambda_function.arn}"
}

output "aws_lambda_function_invoke_arn" {
  value = "${aws_lambda_function.lambda_function.invoke_arn}"
}

output "aws_lambda_function_version" {
  value = "${aws_lambda_function.lambda_function.version}"
}

output "aws_api_gateway_resource_id" {
  value = "${aws_api_gateway_resource.api_resource.id}"
}

output "aws_api_gateway_resource_path" {
  value = "${aws_api_gateway_resource.api_resource.path}"
}

output "aws_api_gateway_deployment_id" {
  value = "${aws_api_gateway_deployment.deployment.id}"
}

output "aws_api_gateway_deployment_invoke_url" {
  value = "${aws_api_gateway_deployment.deployment.invoke_url}"
}

output "aws_api_gateway_deployment_execution_arn" {
  value = "${aws_api_gateway_deployment.deployment.invoke_url}"
}
