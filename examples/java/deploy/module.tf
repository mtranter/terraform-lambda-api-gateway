variable "region" {
  default = "eu-west-1"
}

provider "aws" {
  region = "${var.region}"
}

resource "aws_api_gateway_rest_api" "test_node_api" {
  name        = "TestApiGatewayWithLambdaJava"
  description = "Test Api Gateway With Lambda Java"
}

module "node-example" {
  source        = "github.com/mtranter/terraform-lambda-api-gateway//module"
  source_file   = "./../src/target/hellolambdajava-0.1.0-SNAPSHOT.jar"
  function_name = "java-example"
  runtime       = "java8"
  handler       = "com.trizzle.hellolambda.HelloLambdaHandler"
  stage_name    = "prod"
  account_id    = "277618971297"
  rest_api_id   = "${aws_api_gateway_rest_api.test_node_api.id}"
  parent_id     = "${aws_api_gateway_rest_api.test_node_api.root_resource_id}"
  path_part     = "hellolambdajava"
  http_method   = "GET"
  region        = "${var.region}"
}

output "invoke_url" {
  value = "${module.node-example.aws_api_gateway_deployment_invoke_url}"
}
