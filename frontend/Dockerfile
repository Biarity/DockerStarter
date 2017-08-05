FROM alpine
WORKDIR ./app

ARG frontend-repo
ARG frontend-branch

RUN apk update && apk add git
RUN git clone -b $frontend-branch $frontend-repo .

## BUILD LINES (ps. last actual build line should be CMD since this repo stops @ end)
RUN apk add --update nodejs nodejs-npm && npm install npm@latest -g
CMD npm install && npm run build
