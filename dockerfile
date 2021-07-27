FROM mcr.microsoft.com/dotnet/sdk:5.0 as build

USER root
RUN apt-get update && apt-get install -y gnupg2
RUN curl -fsSL https://deb.nodesource.com/setup_current.x | apt-get install -y nodejs npm

WORKDIR /source
COPY *.sln .
COPY DotnetTemplate.Web/*.csproj ./DotnetTemplate.Web/
COPY DotnetTemplate.Web.Tests/*.csproj ./DotnetTemplate.Web.Tests/
RUN dotnet restore

COPY DotnetTemplate.Web/. ./DotnetTemplate.Web/
WORKDIR /source/DotnetTemplate.Web/
RUN dotnet publish -c release -o /app

FROM mcr.microsoft.com/dotnet/aspnet:5.0
WORKDIR /app
COPY --from=build /app ./
ENTRYPOINT ["dotnet", "DotnetTemplate.Web.dll"]