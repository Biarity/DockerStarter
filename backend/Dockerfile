FROM microsoft/dotnet:latest
COPY . /app/backend
WORKDIR ./app/backend

RUN dotnet restore
RUN dotnet build

EXPOSE 5000/tcp
ENV ASPNETCORE_URLS http://*:5000

RUN sed -i.bak 's/\r$//' ./entrypoint.sh
RUN chmod +x ./entrypoint.sh
CMD /bin/bash ./entrypoint.sh