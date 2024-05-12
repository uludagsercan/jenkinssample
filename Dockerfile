FROM mcr.microsoft.com/dotnet/sdk:6.0 as build
WORKDIR /app
EXPOSE 80
COPY . .

RUN dotnet publish *.csproj -c Release -o out
FROM mcr.microsoft.com/dotnet/aspnet:6.0 as runtime
WORKDIR /app
COPY --from=build /app/out .
ENTRYPOINT [ "dotnet","jetkinssample.dll" ]