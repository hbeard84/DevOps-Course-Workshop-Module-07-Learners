FROM mcr.microsoft.com/dotnet/core/sdk:3.1
COPY . . 
RUN apt-get update \      
  && apt-get install curl gnupg -yq \      
  && curl -sL https://deb.nodesource.com/setup_10.x | bash \      
  && apt-get install nodejs -yq  
RUN dotnet build 
WORKDIR DotnetTemplate.Web
RUN npm i && npm run build
ENTRYPOINT ["dotnet", "run"]
