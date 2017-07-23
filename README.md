# Docker Starter
Docker starter project for ASP.NET Core app with a JS SPA frontend served by nginx and a PostgreSQL database. 

TODO: create a better nginx file @ nginx/default

# Usage
* Initially
    * install docker
    * install git
    * move this entire folder to host machine into /app/source
        * `git clone https://github.com/Biarity/DockerStarter.git /app/source`

* For backend
    * `git clone [repo containing backend asp.net core code] /app/source/backend`
    * (+ to only update)
        * `cd /app/source && docker-compose build backend && docker-compose up --no-deps -d backend`
    
* For frontend
    * `git clone [repo containing frontend code] /app/source/frontend`
    * Update frontend/Dockerfile to build solution into /app/source/frontend/dist correctly
    * (+ to only update)
        * `cd /app/source && docker-compose build frontend && docker-compose up --no-deps -d frontend`

* Start compose server (ie. to update all)
    * `cd /app/source && docker-compose build && docker-compose up -d`


# Commands
* Windows: Via docker quickstart terminal in directory containing docker-compose.yml
* Linux: just use terminal in directory containing docker-compose.yml

* When updating entire thing
    * `docker-compose build`
        * builds images out of all the Dockerfiles mentioned in docker-compose.yml
    * `docker-compose images`
        * see list of built images
    * `docker-compose up`
        * starts running containers from all relevant images and coordinating them
        * `-d` run detached in the background
    * `docker-compose ps`
        * see list of running containers
    * `docker-compose stop`
        * stop containers from running
    * `docker-compose down`
        * stop & delete containers, delete images
    * `docker-compose logs`

* When updating only a small part
    * First, upload the updated code for that specific service
        * For example, upload the new backend/helloapp source code 
        * Best way to do this is via Git to only update the parts that need changing
        * Don't forget, backend's Dockerfile is set up to build so you only need to update the source code
    * `docker-compose build [service name]`
        * build images of specific service, use when updating only that one
    * `docker-compose up --no-deps -d [service name]`
        * recreate and restart only a specific service


# Misc
* PostgreSQL config
    * See postgres/Dockerfile to set up default db name, username, and password
        * Note database is not exposed on the outside so don't complicate too much
    * See backend/helloapp/appsettings.json for example on setting up connection string

* PostgreSQL volumes
    * the volumes contain postgresql's data, config, and logs
    * they are sync'd from the docker container to the local host machine
    * should persist even if container delete
    * @ /app/pg-vols @ local machine (host)

* PostgreSQL auto backups
    * TODO: use this command with cron do generate auto backups, also make rotating so dumps don't accumulate
        * ``pg_dumpall -c  | gzip > /app/pg_backups/dump_`date +%d-%m-%Y"_"%H_%M_%S`.gz``

* Other paths
    * everything is in /app
    * backend build @ /app/backend @ backend container
    * frontend @ /app/frontend @ reverse-proxy container
