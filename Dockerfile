FROM mcr.microsoft.com/dotnet/sdk 
COPY . . 
RUN apt-get update \      
  && apt-get install curl gnupg -yq \      
  && curl -sL https://deb.nodesource.com/setup_10.x | bash \      
  && apt-get install nodejs -yq  
RUN dotnet build 
RUN cd DotnetTemplate.Web && npm i && npm t && npm run lint
ENTRYPOINT dotnet run
