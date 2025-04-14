# See https://aka.ms/customizecontainer to learn how to customize your debug container and how Visual Studio uses this Dockerfile to build your images for faster debugging.
# ENV  ASPNETCORE_ENVIRONMENT=Development

# This stage is used when running from VS in fast mode (Default for Debug configuration)
FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS base
USER $APP_UID
WORKDIR /app
EXPOSE 8080
EXPOSE 8081
# Enviroment variable for connection string
# ENV SQL_CONNECTION_STRING="Server=localhost,5000;Database=Product;Trusted_Connection=false;MultipleActiveResultSets=true;Encrypt=false;User Id=SA;Password=Password1;"
ENV SQL_CONNECTION_STRING="Server=host.docker.internal,1433;Database=Product;Trusted_Connection=false;MultipleActiveResultSets=true;Encrypt=false;user id=sa;password=Password1;"

# This stage is used to build the service project
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
ARG BUILD_CONFIGURATION=Release
WORKDIR /src
COPY ["WebsiteDocker/WebsiteDocker.csproj", "WebsiteDocker/"]
RUN dotnet restore "./WebsiteDocker/WebsiteDocker.csproj"
COPY . .
WORKDIR "/src/WebsiteDocker"
RUN dotnet build "./WebsiteDocker.csproj" -c $BUILD_CONFIGURATION -o /app/build

# This stage is used to publish the service project to be copied to the final stage
FROM build AS publish
ARG BUILD_CONFIGURATION=Release
RUN dotnet publish "./WebsiteDocker.csproj" -c $BUILD_CONFIGURATION -o /app/publish /p:UseAppHost=false

# This stage is used in production or when running from VS in regular mode (Default when not using the Debug configuration)
FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "WebsiteDocker.dll"]