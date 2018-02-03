variable "source_file" {
  default = "./src.zip"
}

variable "region" {
  default = "eu-west-1"
}

provider "aws" {
  region = "${var.region}"
}

data "archive_file" "lambda" {
  type        = "zip"
  source_dir  = "./../src"
  output_path = "${var.source_file}"
}

resource "aws_api_gateway_rest_api" "test_node_api" {
  name        = "TestApiGatewayWithLambdaNode"
  description = "Test Api Gateway With Lambda Node"
}

module "node-example" {
  source        = "github.com/mtranter/terraform-lambda-api-gateway//module"
  source_file   = "${data.archive_file.lambda.output_path}"
  function_name = "node-example"
  runtime       = "nodejs6.10"
  handler       = "index.handler"
  stage_name    = "prod"
  account_id    = "277618971297"
  rest_api_id   = "${aws_api_gateway_rest_api.test_node_api.id}"
  parent_id     = "${aws_api_gateway_rest_api.test_node_api.root_resource_id}"
  path_part     = "hellolambdanode"
  http_method   = "GET"
  region        = "${var.region}"
}

output "invoke_url" {
  value = "${module.node-example.aws_api_gateway_deployment_invoke_url}"
}
