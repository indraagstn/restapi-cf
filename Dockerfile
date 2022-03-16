
# FROM mysql:latest
FROM python:3.8

#change to bash
SHELL ["/bin/bash", "-c"]

#install dependencies
RUN apt-get update && apt-get install -y \
#     nano \
#     python3-dev \
#     python3-pip \
    default-libmysqlclient-dev \
    build-essential

#env var
ENV MYSQL_HOST "127.0.0.1"
ENV MYSQL_PORT 3306
ENV MYSQL_USER "root"
ENV MYSQL_PASSWORD "root"
ENV MYSQL_DBNAME "cf_test"
ENV MYSQL_DATABASE $MYSQL_DBNAME

#db config, import local db
# EXPOSE 3306
# ADD cf_test_db.sql /docker-entrypoint-initdb.d/


##================================================
#PROJECT CONFIG

#setup project
RUN mkdir /app
WORKDIR /app
# RUN python venv .venv
# RUN source .venv/bin/activate
ADD requirements.txt /app/
RUN pip3 install -r requirements.txt
ADD . /app/

#open port
EXPOSE 3030

#RUN!
ENTRYPOINT [ "python3" ]
CMD ["app2.py"]
# CMD gunicorn -w 4 -b 0.0.0.0:3030 wsgi:app