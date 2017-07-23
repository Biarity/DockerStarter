FROM nginx
COPY ./nginx/nginx.conf etc/nginx/nginx.conf
COPY ./nginx/default etc/nginx/sites-available/default


RUN apt-get -y update && apt-get -y install git
RUN git clone REPO_CONTAINING_FRONTEND_CODE .

## Edit 2 below lines if you have to then uncomment
# RUN apt-get -y update && apt-get -y install nodejs && apt-get -y install npm
# RUN npm run build

ADD ./dist app/frontend