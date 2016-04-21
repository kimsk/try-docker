FROM ubuntu
RUN apt-get update
RUN apt-get install -y apache2
RUN touch /opt/b.txt
