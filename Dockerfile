# 使用官方的 .NET Core SDK 作為基本映像
FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build-env
# 設定工作目錄
WORKDIR /App
# 複製專案檔案到容器中
COPY . ./
# Restore as distinct layers
RUN dotnet restore
# 使用 dotnet CLI 發布應用程式
RUN dotnet publish -c Release -o out
# 使用官方的 .NET Core 运行时映像作為最終映像
FROM mcr.microsoft.com/dotnet/aspnet:6.0
# 設定工作目錄
WORKDIR /App
# 複製已發布的應用程式到容器中
COPY --from=build-env /App/out .
# 設定環境變數
ENV ASPNETCORE_URLS=http://+:8080
EXPOSE 8080
# 啟動應用程式
ENTRYPOINT ["dotnet", "PizzaStore.dll"]

