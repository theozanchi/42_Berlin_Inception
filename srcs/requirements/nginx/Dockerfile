FROM debian:stable

WORKDIR /nginx

COPY . .

RUN apt-get update && apt-get install nginx

CMD [ "./launch.sh" ]

EXPOSE port