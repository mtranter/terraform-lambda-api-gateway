cd ./src/LambdaDotNet
dotnet restore
dotnet build
dotnet lambda package
cd ./../../deploy
terraform apply
