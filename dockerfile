# syntax=docker/dockerfile:1

FROM mcr.microsoft.com/dotnet/sdk:6.0-nanoserver-ltsc2022 AS build-env
# FROM mcr.microsoft.com/dotnet/sdk:6.0-bullseye-slim AS build-env
WORKDIR /src
COPY . ./
RUN dotnet restore
RUN dotnet build --no-restore --configuration Release
RUN dotnet publish --no-build --configuration Release --output publish

FROM mcr.microsoft.com/dotnet/aspnet:6.0-nanoserver-ltsc2022
# FROM mcr.microsoft.com/dotnet/aspnet:6.0-bullseye-slim
WORKDIR ./
COPY --from=build-env /src/publish .
ENTRYPOINT ["dotnet", "TesteDocker.dll", "--urls", "http://0.0.0.0:5000"]
