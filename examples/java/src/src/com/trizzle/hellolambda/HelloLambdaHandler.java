package com.trizzle.hellolambda;

import java.util.HashMap;
import java.util.Map;
import com.amazonaws.services.lambda.runtime.Context;
import com.amazonaws.services.lambda.runtime.RequestHandler;
import com.onelostlogician.aws.proxy.ApiGatewayProxyRequest;
import com.onelostlogician.aws.proxy.ApiGatewayProxyResponse;

public class HelloLambdaHandler implements RequestHandler<ApiGatewayProxyRequest, ApiGatewayProxyResponse> {


    public ApiGatewayProxyResponse handleRequest(ApiGatewayProxyRequest apiGatewayProxyRequest, Context context) {
        Map<String,String> headers = new HashMap<String, String>(1);
        headers.put("content-type", "text/html");
        return new ApiGatewayProxyResponse.ApiGatewayProxyResponseBuilder()
                .withHeaders(headers)
                .withBody("<html>\n" +
                        "      <head>\n" +
                        "        <title>Hello From Lambda</title>\n" +
                        "        <link href=\"https://fonts.googleapis.com/css?family=Saira\" rel=\"stylesheet\">\n" +
                        "        <style>\n" +
                        "        body {\n" +
                        "          font-family: 'Saira', sans-serif;\n" +
                        "        }\n" +
                        "        </style>\n" +
                        "      </head>\n" +
                        "      <body>\n" +
                        "        <h1>Hello From Lambda</h1>\n" +
                        "        <h5>Written in Java</h5>\n" +
                        "        <h5>Deployed by Terraform</h5>\n" +
                        "      </body>\n" +
                        "    </html>")
                .withStatusCode(200)
                .build();
    }
}