FROM ubuntu:20.04

RUN apt update 

RUN apt install python3 python3-pip git unzip -y

# Uncomment and modify the following lines if you want to clone the repository and unzip the content
# RUN wget https://group5-braincells.s3.amazonaws.com/python-web-app.zip && \
#     unzip python-web-app.zip && \
#     rm python-web-app.zip
# WORKDIR /path/to/unzipped/folder

WORKDIR /app

COPY . /app

RUN pip3 install -r requirements.txt

# Run migrations
RUN python3 manage.py migrate

EXPOSE 8000

ENTRYPOINT ["python3"]

CMD ["manage.py", "runserver", "0.0.0.0:8000"]


