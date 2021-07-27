FROM mcr.microsoft.com/dotnet/sdk:5.0

USER root
RUN apt-get update && apt-get install -y gnupg2
RUN curl -fsSL https://deb.nodesource.com/setup_current.x | apt-get install -y nodejs npm

COPY . /app/
WORKDIR /app/DotnetTemplate.Web/
RUN npm install && npm run build

WORKDIR /app
RUN dotnet build
WORKDIR /app/DotnetTemplate.Web/
ENTRYPOINT dotnet run
