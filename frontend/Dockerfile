FROM nginx
COPY ./nginx/nginx.conf etc/nginx/nginx.conf
COPY ./nginx/default etc/nginx/sites-available/default

## Edit 2 below lines if you have to then uncomment
# RUN apt-get -y update && apt-get -y install nodejs && apt-get -y install npm
# RUN npm run build

ADD ./dist app/frontend