FROM microsoft/dotnet:latest
COPY . /app/backend
WORKDIR ./app/backend

RUN apt-get -y update && apt-get -y install git
RUN git clone REPO_CONTAINING_BACKEND_ASPNETCORE_SOURCE .

EXPOSE 5000/tcp
ENV ASPNETCORE_URLS http://*:5000

RUN sed -i.bak 's/\r$//' ./entrypoint.sh
RUN chmod +x ./entrypoint.sh
CMD /bin/bash ./entrypoint.sh