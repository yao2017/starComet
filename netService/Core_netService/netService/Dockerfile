FROM microsoft/dotnet:2.1-aspnetcore-runtime AS base
WORKDIR /app
EXPOSE 80
EXPOSE 443

FROM microsoft/dotnet:2.1-sdk AS build
WORKDIR /src
COPY ["netService/netService.csproj", "netService/"]
RUN dotnet restore "netService/netService.csproj"
COPY . .
WORKDIR "/src/netService"
RUN dotnet build "netService.csproj" -c Release -o /app

FROM build AS publish
RUN dotnet publish "netService.csproj" -c Release -o /app

FROM base AS final
WORKDIR /app
COPY --from=publish /app .
ENTRYPOINT ["dotnet", "netService.dll"]