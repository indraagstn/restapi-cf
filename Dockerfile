
FROM mysql:latest

#change to bash
SHELL ["/bin/bash", "-c"]

#install awal
RUN apt-get update && apt-get install -y \
#     nano \
    python3 \
    python3-pip

#env var
ENV MYSQL_HOST "localhost"
ENV MYSQL_PORT 3306
ENV MYSQL_USER "admin"
ENV MYSQL_PASSWORD "admin"
ENV MYSQL_DBNAME "cf_test"
ENV MYSQL_DATABASE $MYSQL_DBNAME

#db config, import local db
# EXPOSE 3306
ADD cf_test_db.sql /
RUN mysql -u $MYSQL_USER -p$MYSQL_PASSWORD $MYSQL_DATABASE < cf_test_db.sql


##================================================
#PROJECT CONFIG


# #setup project
# RUN mkdir /app
# WORKDIR /app
# # RUN python venv .venv
# # RUN source .venv/bin/activate
# ADD requirements.txt /app/
# RUN pip3 install -r requirements.txt
# ADD . /app/
#
# #open port
# EXPOSE 3000
#
# #RUN!
# # ENTRYPOINT [ "python3" ]
# # CMD ["application.py"]
# CMD gunicorn -w 4 -b 0.0.0.0:3000 application:server