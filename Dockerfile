FROM python:3.6
ENV PYTHONUNBUFFERED 1

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

RUN apt-get update
RUN apt-get install python3-dev default-libmysqlclient-dev  -y

RUN mkdir /django_project
WORKDIR /django_project
ADD requirements.txt /django_project/
RUN pip install --upgrade pip && pip install -r requirements.txt
ADD . /django_project/

RUN adduser user
USER user