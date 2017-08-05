FROM microsoft/dotnet:latest
WORKDIR ./app

ARG backend-repo
ARG backend-branch

RUN apt-get -y update && apt-get -y install git
RUN git clone -b $backend-branch $backend-repo .

# BUILD LINES
EXPOSE 5000/tcp
ENV ASPNETCORE_URLS http://*:5000

COPY ./entrypoint.sh .
RUN sed -i.bak 's/\r$//' ./entrypoint.sh
RUN chmod +x ./entrypoint.sh
CMD /bin/bash ./entrypoint.sh