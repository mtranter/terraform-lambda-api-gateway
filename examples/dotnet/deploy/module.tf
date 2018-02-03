variable "region" {
  default = "eu-west-1"
}

provider "aws" {
  region = "${var.region}"
}

resource "aws_api_gateway_rest_api" "test_dotnet_api" {
  name        = "TestApiGatewayWithLambdaDotNet"
  description = "Test Api Gateway With Lambda DotNet"
}

module "dotnet-example" {
  source           = "github.com/mtranter/terraform-lambda-api-gateway//module"
  source_file      = "./../src/LambdaDotNet/bin/Release/netcoreapp1.0/LambdaDotNet.zip"
  function_name    = "dotnet-example"
  runtime          = "dotnetcore1.0"
  handler          = "LambdaDotNet::Trizzle.Lambda::Handler"
  stage_name       = "prod"
  account_id       = "277618971297"
  rest_api_id      = "${aws_api_gateway_rest_api.test_dotnet_api.id}"
  parent_id        = "${aws_api_gateway_rest_api.test_dotnet_api.root_resource_id}"
  path_part        = "hellolambdadotnet"
  http_method      = "GET"
  region           = "${var.region}"
  function_timeout = "30"
}

output "invoke_url" {
  value = "${module.dotnet-example.aws_api_gateway_deployment_invoke_url}"
}
