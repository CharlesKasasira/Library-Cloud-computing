# base image
FROM python:3.9.7-buster
 
# options
ENV PYTHONUNBUFFERED 1
 
# Set working directory
RUN mkdir core
# set the working directory
COPY . /core/
# coppy commands 
WORKDIR /core
 
# update docker-iamage packages
# RUN apt-get update && \
#     apt-get upgrade -y && \
#     apt-get install -y netcat-openbsd gcc && \
#     apt-get clean
 
# update pip 
RUN pip install --upgrade pip
# install psycopg for connect to pgsql
RUN pip install psycopg2-binary
# install python packages 
RUN pip install -r requirements.txt
# create static directory
# RUN mkdir static
# RUN python manage.py collectstatic --no-input
EXPOSE 8000

#run the server
# ENTRYPOINT ["python", "library/manage.py"]
# CMD ['runserver', '0.0.0.0:8000']

CMD ["gunicorn","--bind", ":5000", "core.wsgi:application"]