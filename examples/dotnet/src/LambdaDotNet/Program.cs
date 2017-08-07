
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Threading.Tasks;

using Amazon.Lambda.Core;
using Amazon.Lambda.APIGatewayEvents;

// Assembly attribute to enable the Lambda function's JSON input to be converted into a .NET class.
[assembly: LambdaSerializer(typeof(Amazon.Lambda.Serialization.Json.JsonSerializer))]
namespace Trizzle
{
    public class Lambda
    {
        /// <summary>
        /// Default constructor that Lambda will invoke.
        /// </summary>
        public Lambda()
        {
        }


        /// <summary>
        /// A Lambda function to respond to HTTP Get methods from API Gateway
        /// </summary>
        /// <param name="request"></param>
        /// <returns>The list of blogs</returns>
        public APIGatewayProxyResponse Handler(APIGatewayProxyRequest request, ILambdaContext context)
        {
            context.Logger.LogLine("Get Request\n");

            var response = new APIGatewayProxyResponse
            {
                StatusCode = (int)HttpStatusCode.OK,
                Body = @"
    <html>
      <head>
        <title>Hello From Lambda</title>
        <link href=""https://fonts.googleapis.com/css?family=Saira"" rel=""stylesheet"">
        <style>
        body {
          font-family: 'Saira', sans-serif;
        }
        </style>
      </head>
      <body>
        <h1>Hello From Lambda</h1>
        <h5>Written in C#</h5>
        <h5>Deployed by Terraform</h5>
      </body>
    </html>",
                Headers = new Dictionary<string, string> { { "Content-Type", "text/html" } }
            };

            return response;
        }
    }
}
