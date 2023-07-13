FROM ubuntu
RUN apt update --fix-missing -y
RUN apt upgrade -y
RUN apt clean -y
EXPOSE 8000 
#WORKDIR /var/www/django
RUN mkdir -p /var/www
COPY django.tar /var/www/
WORKDIR /var/www
RUN tar xvf django.tar
RUN rm django.tar
WORKDIR django
RUN apt-get install -y python3 python3-pip
RUN pip install django
CMD python3 manage.py runserver 0.0.0.0:8000
