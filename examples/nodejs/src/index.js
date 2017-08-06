module.exports.handler = function(event, context, callback) {
  callback(null, {
    statusCode: '200',
    body: `
    <html>
      <head>
        <title>Hello From Lambda</title>
        <link href="https://fonts.googleapis.com/css?family=Saira" rel="stylesheet">
        <style>
        body {
          font-family: 'Saira', sans-serif;
        }
        </style>
      </head>
      <body>
        <h1>Hello From Lambda</h1>
        <h5>Deployed by Terraform</h5>
      </body>
    </html>
`,
    headers: {
      'Content-Type': 'text/html',
    },
  });
};
